part of '../drafting_storage.dart';

class DraftingStorageImpl extends DraftingStorage {
  late Isar isar;

  @override
  Future<void> initDraftingLocalDb(Isar isar) async {
    this.isar = isar;
  }

  @override
  Stream<void> listenCart(int id) {
    return isar.draftingInvoiceTables.watchObjectLazy(id);
  }

  @override
  Future<void> clearCart() async {
    // clear toàn bộ data
    await isar.writeTxn(() async {
      await isar.customerTables.clear();
      await isar.paymentMethodTables.clear();
      await isar.productTables.clear();
      await isar.draftingInvoiceTables.clear();
    });
  }

  @override
  Future<List<DraftingInvoiceTable>> getCarts() async {
    try {
      final carts = await isar.draftingInvoiceTables
          .where()
          .sortByCreatedDateDesc()
          .findAll();

      await Future.forEach(carts, (DraftingInvoiceTable cart) async {
        // Preload tất cả các liên kết cần thiết
        await _loadCartInfo(cart);
      });

      return carts;
    } catch (e, stackTrace) {
      // Log chi tiết lỗi và stack trace
      debugPrint('Error loading carts: $e\n$stackTrace');
      return [];
    }
  }

  @override
  Future<DraftingInvoiceTable?> updateCurrentStore({
    required int cartId,
    required StoreModel? store,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.store = store;
      await isar.draftingInvoiceTables.put(currentDraft);
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> addItemsToCart({
    required List<ProductTable> products,
    required int cartId,
    List<ProductTable>? gifts,
    List<ProductTable>? attaches,
    List<ProductTable>? warranties,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      // Lấy danh sách sản phẩm hiện tại
      Map<String, ProductTable> productMap = {
        for (var product in currentDraft.getProducts)
          product.productId!: product,
      };

      for (var product in products) {
        ProductTable? processedProduct = await _processItemsInCart(
          currentDraft: currentDraft,
          product: product,
          productMap: productMap,
          productType: product.productType,
        );

        if (processedProduct != null) {
          // Cập nhật liên kết sử dụng helper
          await Future.wait([
            _updateLinks<ProductTable>(
              processedProduct.productsGift,
              gifts,
              (item) => isar.productTables.put(item),
            ),
            _updateLinks<ProductTable>(
              processedProduct.productsAttach,
              attaches,
              (item) => isar.productTables.put(item),
            ),
          ]);
        }
      }

      // Lưu giỏ hàng
      await currentDraft.products.save();
      cartId = await isar.draftingInvoiceTables.put(currentDraft);
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> addItemToCart({
    required ProductTable product,
    required int cartId,
    List<ProductTable>? gifts,
    List<ProductTable>? attaches,
    List<ProductTable>? warranties,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      // Lấy danh sách sản phẩm hiện tại từ giỏ hàng
      List<ProductTable> currentProducts = currentDraft.getProducts;
      Map<String, ProductTable> productMap = {
        for (var currentProduct in currentProducts)
          currentProduct.productId!: currentProduct,
      };

      ProductTable? processedProduct = await _processItemsInCart(
        currentDraft: currentDraft,
        product: product,
        productMap: productMap,
        productType: product.productType,
      );

      if (processedProduct != null) {
        /// Cập nhật liên kết
        await _updateLinks<ProductTable>(processedProduct.productsGift, gifts, (
          item,
        ) {
          item.itemType = XItemType.gift;
          return isar.productTables.put(item);
        });
        await _updateLinks<ProductTable>(
          processedProduct.productsAttach,
          attaches,
          (item) {
            item.itemType = XItemType.attach;
            return isar.productTables.put(item);
          },
        );
      }

      // Lưu giỏ hàng và các liên kết
      cartId = await isar.draftingInvoiceTables.put(currentDraft);
      await currentDraft.products.save();

      if (processedProduct != null) {
        await _loadProductChild(processedProduct);
      }
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateItemToCart({
    required ProductTable product,
    required int cartId,
    List<ProductTable>? gifts,
    List<ProductTable>? attaches,
    List<ProductTable>? warranties,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      final productMap = {
        for (var prod in currentDraft.products) prod.id: prod,
      };

      int productId = product.id;

      if (productMap.containsKey(productId)) {
        // Lấy sản phẩm cần cập nhật
        ProductTable existingProduct = productMap[productId]!;

        // xóa các liên kết liên quan tới sản phẩm quà tặng, phụ kiện, bảo hành, voucher
        await Future.wait([
          if (existingProduct.productsGift.isNotEmpty)
            isar.productTables.deleteAll(
              existingProduct.productsGift.map((e) => e.id).toList(),
            ),
          if (existingProduct.productsAttach.isNotEmpty)
            isar.productTables.deleteAll(
              existingProduct.productsAttach.map((e) => e.id).toList(),
            ),
        ]);

        // Lưu lại thông tin sản phẩm sau khi cập nhật liên kết
        await isar.productTables.put(existingProduct);

        await currentDraft.products.save();

        // Load lại sản phẩm con
        await _loadProductChild(existingProduct);

        // Cập nhật từng liên kết (xóa cũ + thêm mới)
        await Future.wait([
          _updateLinks<ProductTable>(
            existingProduct.productsGift,
            gifts,
            (item) => isar.productTables.put(
              item..itemType = XItemType.gift,
            ),
          ),
          _updateLinks<ProductTable>(
            existingProduct.productsAttach,
            attaches,
            (item) => isar.productTables.put(
              item..itemType = XItemType.attach,
            ),
          ),
        ]);

        // Lưu lại thông tin sản phẩm sau khi cập nhật liên kết
        await isar.productTables.put(existingProduct);

        await currentDraft.products.save();

        // Load lại sản phẩm con
        await _loadProductChild(existingProduct);
      }

      // Lưu giỏ hàng sau khi cập nhật sản phẩm
      await isar.draftingInvoiceTables.put(currentDraft);
      await currentDraft.products.save();
    });

    return currentDraft;
  }

  @override
  Future<bool?> removeCartById(int cartId) async {
    DraftingInvoiceTable? cart = await getCart(cartId);
    if (cart == null) return false;

    return await isar.writeTxn(() async {
      // Xóa sản phẩm liên kết
      if (cart.getProducts.isNotEmpty) {
        for (var product in cart.getProducts) {
          await _removeProductDependencies(product);
          await isar.productTables.delete(product.id);
        }
      }

      // Xóa khách hàng liên kết
      if (cart.customer.value != null) {
        await isar.customerTables.delete(cart.customer.value!.id);
      }

      // Xóa phương thức thanh toán
      if (cart.getPaymentMethods.isNotEmpty) {
        await isar.paymentMethodTables.deleteAll(
          cart.getPaymentMethods.map((e) => e.id).toList(),
        );
      }

      // Xóa các khoản đã trả trước
      if (cart.getPaymentMethodsPrePay.isNotEmpty) {
        await isar.paymentMethodTables.deleteAll(
          cart.getPaymentMethodsPrePay.map((e) => e.id).toList(),
        );
      }

      // Xóa giỏ hàng
      return await isar.draftingInvoiceTables.delete(cart.id);
    });
  }

  @override
  Future<int?> createNewCart({required CartType typeCart}) async {
    // Tạo khách hàng mới
    final newCustomer = CustomerTable();

    // Lấy thông tin người dùng
    final AuthModel? userInfo = getIt<AuthBloc>().state.userInfo;

    DraftingInvoiceTable newCart = DraftingInvoiceTable();

    // Lưu dữ liệu vào Isar
    await isar.writeTxn(() async {
      await isar.customerTables.put(newCustomer); // Lưu thông tin khách hàng

      // Tạo giỏ hàng mới
      newCart = _initializeCart(typeCart, newCustomer, userInfo);

      await isar.draftingInvoiceTables.put(newCart); // Lưu thông tin giỏ hàng

      // Lưu liên kết
      await newCart.customer.save();
      await newCart.products.save();
    });

    return newCart.id;
  }

  @override
  Future<DraftingInvoiceTable?> updateCustomerInfo({
    required int cartId,
    required CustomerModel customerInfo,
  }) async {
    // Lấy giỏ hàng hiện tại
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    // Khởi động transaction để thực hiện các cập nhật
    await isar.writeTxn(() async {
      // Lấy thông tin khách hàng từ giỏ hàng
      var customer = currentDraft.getCustomer;
      late CustomerTable newCustomerData;

      if (customer != null) {
        // Cập nhật thông tin khách hàng
        newCustomerData = await _updateCustomerData(customer, customerInfo);
        currentDraft.customer.value = newCustomerData;
      } else {
        // Nếu không có khách hàng trong giỏ hàng, tạo mới
        final newCustomer = CustomerTable();
        newCustomerData = await _updateCustomerData(newCustomer, customerInfo);
        currentDraft.customer.value = newCustomerData;
      }

      // Lưu lại khách hàng đã cập nhật vào cơ sở dữ liệu
      await isar.customerTables.put(newCustomerData);
      await currentDraft.customer.save();

      // Lưu giỏ hàng sau khi cập nhật
      await isar.draftingInvoiceTables.put(currentDraft);
    });

    // Xóa thông tin giảm giá cũ nếu có
    await clearDiscountInfo(cartId);

    // Trả về giỏ hàng đã cập nhật
    return await getCart(cartId);
  }

  @override
  Future<DraftingInvoiceTable?> getCart(int cartId) async {
    final cart = await _findCart(cartId: cartId);
    if (cart != null) {
      // Tải các dữ liệu liên quan đến giỏ hàng
      await _loadCartInfo(cart);
    }
    return cart;
  }

  @override
  Future<int> countTotalBill() async {
    return await isar.draftingInvoiceTables.where().count();
  }

  @override
  Future<DraftingInvoiceTable?> removeProductOnCart({
    required int productId,
    required int cartId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      List<ProductTable> productsToRemove = [];

      // Duyệt qua tất cả sản phẩm trong giỏ hàng
      currentDraft.products.removeWhere((product) {
        if (product.id == productId) {
          productsToRemove.add(product);

          // Xóa toàn bộ liên kết của sản phẩm
          productsToRemove.addAll(product.getGifts);
          productsToRemove.addAll(product.getAttaches);

          product.productsGift.clear();
          product.productsAttach.clear();

          return true; // Xóa sản phẩm khỏi danh sách giỏ hàng
        }

        // Kiểm tra xem có sản phẩm con nào cần xóa không
        product.productsGift.removeWhere((gift) {
          if (gift.id == productId) {
            productsToRemove.add(gift);
            return true;
          }
          return false;
        });

        product.productsAttach.removeWhere((attach) {
          if (attach.id == productId) {
            productsToRemove.add(attach);
            return true;
          }
          return false;
        });

        return false;
      });

      // lưu lại liên kết
      await Future.wait([
        for (var product in currentDraft.products)
          Future.wait([
            product.productsGift.save(),
            product.productsAttach.save(),
          ]),
      ]);

      // Xóa toàn bộ sản phẩm trong danh sách cần xóa khỏi database
      await isar.productTables.deleteAll(
        productsToRemove.map((e) => e.id).toList(),
      );

      // Cập nhật lại giỏ hàng
      await isar.draftingInvoiceTables.put(currentDraft);
      await currentDraft.products.save();
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> modifyPaymentMethod({
    required int cartId,
    required PaymentMethodTable paymentMethod,
  }) async {
    // Lấy giỏ hàng hiện tại
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      // Kiểm tra xem phương thức thanh toán đã tồn tại trong cơ sở dữ liệu chưa
      PaymentMethodTable? existingPayment = await isar.paymentMethodTables
          .where()
          .idEqualTo(paymentMethod.id)
          .findFirst();

      if (existingPayment != null) {
        // Nếu phương thức thanh toán đã tồn tại, cập nhật thông tin của nó
        paymentMethod.id = existingPayment.id;
        // Lưu lại thông tin đã cập nhật vào cơ sở dữ liệu
        await isar.paymentMethodTables.put(paymentMethod);
      } else {
        // Nếu phương thức thanh toán chưa tồn tại, thêm mới phương thức thanh toán vào cơ sở dữ liệu
        await isar.paymentMethodTables.put(paymentMethod);
        // Thêm phương thức thanh toán vào giỏ hàng
        currentDraft.paymentMethods.add(paymentMethod);
      }

      // Lưu lại giỏ hàng với phương thức thanh toán mới hoặc đã cập nhật
      await isar.draftingInvoiceTables.put(currentDraft);
      // Lưu các liên kết với phương thức thanh toán
      await currentDraft.paymentMethods.save();
      // load lại thông tin thanh toán
      await currentDraft.paymentMethods.load();
    });

    // Trả lại giỏ hàng sau khi thay đổi
    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> removePaymentMethod({
    required int cartId,
    required int paymentMethodId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      await isar.paymentMethodTables.delete(paymentMethodId);
      currentDraft.paymentMethods.removeWhere(
        (element) => element.id == paymentMethodId,
      );

      // Lưu lại giỏ hàng với phương thức thanh toán mới
      await isar.draftingInvoiceTables.put(currentDraft);
      await currentDraft.paymentMethods
          .save(); // Lưu các liên kết với phương thức thanh toán
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateDiscountCoupon({
    required int cartId,
    double? discountTotalBill,
    String? couponDiscountCode,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.discountTotalBill = discountTotalBill;
      currentDraft.couponDiscountCode = couponDiscountCode;
      // Lưu lại giỏ hàng với phương thức thanh toán mới
      await isar.draftingInvoiceTables.put(currentDraft);
    });
    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateBillNote({
    required int cartId,
    String? saleNote,
    String? warrantyNote,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.saleNote = saleNote;
      currentDraft.warrantyNote = warrantyNote;
      // Lưu lại giỏ hàng với phương thức thanh toán mới
      await isar.draftingInvoiceTables.put(currentDraft);
    });
    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> clearCustomerInfo({required int cartId}) async {
    var currentCart = await getCart(cartId);
    if (currentCart == null) return null;
    const noneDiscountType = DiscountMemberType.none;
    await isar.writeTxn(() async {
      await _deleteCustomerFromCart(currentCart);
      await _updateCartStatus(currentCart, noneDiscountType);
      await isar.draftingInvoiceTables.put(currentCart);
    });
    return currentCart;
  }

  @override
  Future<DraftingInvoiceTable?> deleteDiscountBillByPoint(
      {required int cartId}) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    CustomerTable? customerTable = currentDraft?.getCustomer;
    OtpCustomerPointModel? discountByPoint = customerTable?.discountByPoint;

    if (currentDraft == null ||
        discountByPoint == null ||
        !(discountByPoint.isValidOTP ?? false)) {
      return currentDraft;
    }

    await isar.writeTxn(() async {
      if (customerTable != null) {
        customerTable.discountByPoint = discountByPoint.copyWith(
          isValidOTP: false,
        );
        await isar.customerTables.put(customerTable);
      }

      currentDraft.discountMemberType = DiscountMemberType.none;
      await isar.draftingInvoiceTables.put(currentDraft);
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateDiscountBillByPoint({
    required int cartId,
    OtpCustomerPointModel? discountByPoint,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    CustomerTable? customerTable = currentDraft?.getCustomer;

    if (currentDraft == null || customerTable == null) return null;

    await isar.writeTxn(() async {
      customerTable.discountByPoint = discountByPoint;
      await isar.customerTables.put(customerTable);

      currentDraft.discountMemberType = DiscountMemberType.point;

      await isar.draftingInvoiceTables.put(currentDraft);
    });

    return currentDraft;
  }

  Future<void> clearDiscountInfo(int cartId) async {
    await updateDiscountCoupon(cartId: cartId);
    await deleteDiscountBillByPoint(cartId: cartId);
  }

  @override
  Future<DraftingInvoiceTable?> updateImeiOfProduct({
    required int cartId,
    required ProductImeiModel productImei,
    required int productId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      final product = await isar.productTables.get(productId);

      if (product == null) {
        return currentDraft;
      }

      await _loadProductChild(product);

      product.imei = productImei;

      await isar.productTables.put(product);

      await currentDraft.products.load();
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateNoteOfProduct({
    required int cartId,
    required String note,
    required int productId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      final product = await isar.productTables.get(productId);
      if (product == null) {
        return currentDraft;
      }

      product.note = note;

      await isar.productTables.put(product);

      await currentDraft.products.load();
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateProductDiscountByHand({
    required int cartId,
    required double amount,
    required int discountType,
    required int productId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      final product = await isar.productTables.get(productId);
      if (product == null) {
        return currentDraft;
      }

      product.discountByHand = HandDiscount(type: discountType, amount: amount);

      await isar.productTables.put(product);

      await currentDraft.products.load();
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateProductQuantity({
    required int quantity,
    required int productId,
    required int cartId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      final product = await isar.productTables.get(productId);
      if (product == null) {
        return currentDraft;
      }

      product.quantity = quantity;

      await isar.productTables.put(product);

      await currentDraft.products.load();
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateDeliveryFee({
    int? customerFee,
    int? shippingCompanyFee,
    required int cartId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      if (currentDraft.deliveryFee == null) {
        currentDraft.deliveryFee = DeliveryFeeModel(
          customerFee: customerFee ?? 0,
          shippingCompanyFee: shippingCompanyFee ?? 0,
        );
      } else {
        currentDraft.deliveryFee = currentDraft.deliveryFee!.copyWith(
          customerFee: customerFee,
          shippingCompanyFee: shippingCompanyFee,
        );
      }
      await isar.draftingInvoiceTables.put(currentDraft);
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateOrderSubDetail({
    required OrderSubDetailModel data,
    required int cartId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.orderSubDetail = data;
      await isar.draftingInvoiceTables.put(currentDraft);
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateTradeInType({
    required TradeInType type,
    required int cartId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.tradeInType = type;
      await isar.draftingInvoiceTables.put(currentDraft);
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateProductTradeIn({
    required ProductTable product,
    required int cartId,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.product.value = product;
      await isar.productTables.put(product);
      await currentDraft.product.save();

      await isar.draftingInvoiceTables.put(currentDraft);
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> convertOrderDetailToCartStorage({
    required OrderModel orderDetail,
    required CartType typeCart,
    CustomerModel? customer,
    int? currentDraftId,
  }) async {
    DraftingInvoiceTable? cartTable;
    CustomerTable? customerInfo;

    if (currentDraftId != null) {
      cartTable = await getCart(currentDraftId);
    }

    if (cartTable == null) {
      // nếu đơn nháp chưa được tạo => chưa có thông tin khách => thêm thông tin mới của khách từ order
      customerInfo = CustomerTable()
        ..customerId = orderDetail.customerId
        ..fullName = orderDetail.customerName
        ..phoneNo = orderDetail.getCustomerPhone
        ..city = orderDetail.customerCity
        ..district = orderDetail.customerDistrict
        ..ward = orderDetail.customerWard
        ..address = orderDetail.customerAddress
        ..type = orderDetail.customerType ?? XCustomerType.none
        ..indentifyNo = orderDetail.customerIndentifyNo
        ..gender = customer?.getGender ?? XGenderType.none
        ..appellation = customer?.getGender ?? XGenderType.none;

      cartTable ??= DraftingInvoiceTable()
        ..typeCart = typeCart
        ..createdDate = DateTime.now()
        ..orderId = orderDetail.id
        ..store = orderDetail.getStore
        ..customerNote = orderDetail.customerNote
        ..warrantyNote = orderDetail.warrantyNote
        ..saleNote = orderDetail.saleNote
        ..deliveryFee = orderDetail.getDeliveryFee as DeliveryFeeModel?
        ..orderSubDetail = orderDetail.getOrderSubDetail as OrderSubDetailModel?
        ..isDefaultInfo =
            false; // luôn false do chỉ có sdt từ khách mới tìm thấy
    } else {
      customerInfo = cartTable.getCustomer;

      cartTable
        ..orderId = orderDetail.id
        ..store = orderDetail.getStore
        ..customerNote = orderDetail.customerNote
        ..warrantyNote = orderDetail.warrantyNote
        ..saleNote = orderDetail.saleNote
        ..deliveryFee = orderDetail.getDeliveryFee as DeliveryFeeModel?
        ..orderSubDetail =
            orderDetail.getOrderSubDetail as OrderSubDetailModel?;
    }

    /// thông tin sản phẩm
    List<ProductTable> products = [];

    for (OrderItemModel item in (orderDetail.orderItems ?? [])) {
      // todo: check thông tin nhiều loại sản phẩm
      ProductTable productTable = item.convertToProductTable;
      products.add(productTable);
    }

    /// nếu typeCart là updateOrder => thêm vào paymentMethods
    /// ngược lại
    /// nếu chuyển từ order sang bill thì thêm paymentMethodsPrePay
    List<PaymentMethodTable> payments = [];
    for (PaymentModel payment in (orderDetail.payments ?? [])) {
      PaymentMethodTable paymentMethodTable = PaymentMethodTable();

      paymentMethodTable
        ..paymentType = payment.getPaymentType
        ..methodDeposit = payment.getMethodDeposit
        ..methodDeposit = payment.getMethodDeposit
        ..paymentId = payment.id
        ..amount = payment.paymentAmount
        ..accountDetail = payment.getAccountDetail
        ..installmentMethod = payment.getInstallmentAccountingDetail
        ..refCode = payment.paymentCode
        ..conditionNumber = payment.paymentCode
        ..cardNumber = payment.creditCardNo
        ..idCard = payment.customerIndentifyNo;

      payments.add(paymentMethodTable);
    }

    cartTable.discountTotalBill = orderDetail.discountAmount;
    cartTable.couponDiscountCode = orderDetail.couponCode;

    /// cập nhật thông tin khách hàng
    /// cập nhật đơn nháp

    await isar.writeTxn(() async {
      cartTable!.customer.value = customerInfo;
      if (payments.isNotEmpty) {
        cartTable.paymentMethods.addAll(payments);
      }
      if (products.isNotEmpty) {
        cartTable.products.addAll(products);
      }

      /// thứ tự thêm như sau
      /// 1. thêm customer
      await isar.customerTables.put(customerInfo!);

      /// 2. thêm product theo addItemsToCart
      await isar.productTables.putAll(products);

      /// 3. thêm payments
      await isar.paymentMethodTables.putAll(payments);

      /// 4. thêm cart
      await isar.draftingInvoiceTables.put(cartTable);

      await _saveCartInfo(cartTable);
      return cartTable;
    });

    return cartTable;
  }

  // todo: chuyển đơn hàng thành đơn nháp
  @override
  Future<DraftingInvoiceTable?> convertBillDetailToCartStorage({
    required BillModel billDetail,
    required CartType typeCart,
  }) async {
    /// tìm khách cùng số điện thoại
    CustomerTable? customerInfo = await _findCustomer(
      phone: billDetail.getCustomerPhone,
      customerId: billDetail.customerId,
    );

    /// nếu thông tin là từ sdt mặc định hoặc bị rỗng thì lấy từ order detail
    if (billDetail.getCustomerPhone ==
            AppConstants.defaultCustomer.getCustomerPhone ||
        customerInfo == null) {
      customerInfo ??= billDetail.getCustomerInfo;
    }

    /// kiểm tra xem có đơn nháp nào dng có cùng order id không
    // DraftingInvoiceTable? cartTable = await _findCart(billId: billDetail.id);

    DraftingInvoiceTable? cartTable = DraftingInvoiceTable()
      ..orderId = billDetail.orderId
      ..typeCart = typeCart
      ..billId = billDetail.id
      ..tradeInType = TradeInType.undefine
      ..billNumber = billDetail.billNumber
      ..createdDate = DateTime.now()
      ..customerNote = billDetail.customerNote
      ..warrantyNote = billDetail.warrantyNote
      ..saleNote = billDetail.saleNote
      ..deliveryFee = null
      ..orderSubDetail = null
      ..isDefaultInfo = billDetail.getCustomerPhone ==
          AppConstants.defaultCustomer.getCustomerPhone;

    /// thông tin sản phẩm
    Map<String, ProductTable> productMap = {};

    for (BillItemModel item in (billDetail.billItems ?? [])) {
      // todo: check thông tin nhiều loại sản phẩm
      ProductTable productTable = item.convertToProductTable;

      // nếu quà tặng, bán kèm và bảo hành không trống thì set vào product
      productTable.giftsSelected ??= [];
      if (item.getConvertGifts.isNotEmpty) {
        productTable.giftsSelected!.addAll(item.getConvertGifts);
      }

      productTable.attachesSelected ??= [];
      if (item.getConvertAttaches.isNotEmpty) {
        productTable.attachesSelected!.addAll(item.getConvertAttaches);
      }

      productMap.putIfAbsent(productTable.itemId!, () => productTable);
    }

    // thanh toán
    List<PaymentMethodTable> payments = [];
    for (PaymentModel payment in (billDetail.payments ?? [])) {
      PaymentMethodTable paymentMethodTable = PaymentMethodTable();

      paymentMethodTable
        ..paymentType = payment.getPaymentType
        ..methodDeposit = payment.getMethodDeposit
        ..methodDeposit = payment.getMethodDeposit
        ..paymentId = payment.id
        ..amount = payment.paymentAmount
        ..accountDetail = payment.getAccountDetail
        ..installmentMethod = payment.getInstallmentAccountingDetail
        ..refCode = payment.paymentCode
        ..conditionNumber = payment.paymentCode
        ..cardNumber = payment.creditCardNo
        ..idCard = payment.customerIndentifyNo;

      payments.add(paymentMethodTable);
    }

    cartTable.discountTotalBill = billDetail.discountAmount;
    cartTable.couponDiscountCode = billDetail.couponCode;

    /// cập nhật thông tin khách hàng
    /// cập nhật đơn nháp

    await isar.writeTxn(() async {
      cartTable.customer.value = customerInfo;

      if (payments.isNotEmpty) {
        cartTable.paymentMethods.addAll(payments);
      }
      if (productMap.isNotEmpty) {
        cartTable.products.addAll(productMap.values.toList());
      }

      /// thứ tự thêm như sau
      await Future.wait([
        isar.customerTables.put(customerInfo!),
        isar.productTables.putAll(productMap.values.toList()),
        isar.paymentMethodTables.putAll(payments),
      ]);

      await isar.draftingInvoiceTables.put(cartTable);
    });

    await isar.writeTxn(() async {
      await _saveCartInfo(cartTable);
    });

    final productsCart = cartTable.getProducts;

    await isar.writeTxn(() async {
      for (var productCart in productsCart) {
        // Tìm product gốc tương ứng bằng ID
        final originalProduct = productMap[productCart.itemId!];

        if (originalProduct != null) {
          await Future.wait([
            _updateLinks<ProductTable>(
              productCart.productsGift,
              originalProduct.getGifts,
              (item) {
                item.itemType = XItemType.gift;
                return isar.productTables.put(item);
              },
            ),
            _updateLinks<ProductTable>(
              productCart.productsAttach,
              originalProduct.getAttaches,
              (item) {
                item.itemType = XItemType.attach;
                return isar.productTables.put(item);
              },
            ),
          ]);

          await isar.productTables.put(productCart);
        }
      }
    });

    return cartTable;
  }

  // todo: chuyển hoá đơn thành đơn nháp để bảo hành
  @override
  Future<DraftingInvoiceTable?> convertToWarrantyDraft({
    required BillModel billDetail,
    required CartType typeCart,
    AuthModel? userInfo,
  }) async {
    /// tìm khách cùng số điện thoại
    CustomerTable? customerInfo = await _findCustomer(
      phone: billDetail.getCustomerPhone,
      customerId: billDetail.customerId,
    );

    /// nếu thông tin là từ sdt mặc định hoặc bị rỗng thì lấy từ order detail
    if (billDetail.getCustomerPhone ==
            AppConstants.defaultCustomer.getCustomerPhone ||
        customerInfo == null) {
      customerInfo ??= billDetail.getCustomerInfo;
    }

    DraftingInvoiceTable? cartTable = DraftingInvoiceTable()
      ..typeCart = typeCart
      ..billId = billDetail.id
      ..billNumber = billDetail.billNumber
      ..tradeInType = TradeInType.undefine
      ..createdDate = DateTime.now();

    /// thông tin sản phẩm
    Map<String, ProductTable> productMap = {};

    for (BillItemModel item in (billDetail.billItems ?? [])) {
      // todo: check thông tin nhiều loại sản phẩm
      ProductTable productTable = item.convertToProductTable;
      productMap.putIfAbsent(productTable.itemId!, () => productTable);
    }

    /// cập nhật thông tin khách hàng
    /// cập nhật đơn nháp

    await isar.writeTxn(() async {
      cartTable.customer.value = customerInfo;
      if (productMap.isNotEmpty) {
        cartTable.products.addAll(productMap.values.toList());
      }

      /// thứ tự thêm như sau
      await Future.wait([
        isar.customerTables.put(customerInfo!),
        isar.productTables.putAll(productMap.values.toList()),
      ]);

      await isar.draftingInvoiceTables.put(cartTable);
    });

    await isar.writeTxn(() async {
      await _saveCartInfo(cartTable);
    });

    return cartTable;
  }

  @override
  Future<DraftingInvoiceTable?> updateRepurchasePriceProduct({
    required int cartId,
    required int productId,
    required double repurchasePrice,
    required XItemType productType,
  }) async {
    DraftingInvoiceTable? cart = await _findCart(cartId: cartId);
    if (cart == null) return null;

    // tìm sản phẩm trong productTables theo id và productChildType
    final product = await isar.productTables
        .filter()
        .idEqualTo(productId)
        .itemTypeEqualTo(productType)
        .findFirst();

    if (product == null) return null;

    await isar.writeTxn(() async {
      product.repurchasePrice = repurchasePrice;
      await isar.productTables.put(product);
    });

    // lấy lại cart
    cart = await _findCart(cartId: cartId);

    return cart;
  }

  @override
  Future<DraftingInvoiceTable?> addProductGift({
    required int cartId,
    required ProductModel product,
    required int parentProductId,
  }) async {
    DraftingInvoiceTable? cart = await _findCart(cartId: cartId);
    if (cart == null) return null;

    await isar.writeTxn(() async {
      // tìm sản phẩm gốc
      ProductTable? parentProduct = await isar.productTables
          .filter()
          .idEqualTo(parentProductId)
          .itemTypeEqualTo(XItemType.main)
          .findFirst();

      if (parentProduct == null) return null;

      await _loadProductChild(parentProduct);

      // lấy danh sách gift hiện tại của product
      List<ProductTable> productsGift = parentProduct.getGifts;

      // thêm sản phẩm vào trong danh sách gift
      productsGift.add(product.convertToTable(
        cartId: cartId,
        itemType: XItemType.gift,
      ));

      await _updateLinks<ProductTable>(
        parentProduct.productsGift,
        productsGift,
        (item) {
          item.itemType = XItemType.gift;
          return isar.productTables.put(item);
        },
      );

      // Lưu lại thông tin sản phẩm sau khi cập nhật liên kết
      await isar.productTables.put(parentProduct);
    });

    // lấy lại cart
    cart = await _findCart(cartId: cartId);

    return cart;
  }

  @override
  Future<DraftingInvoiceTable?> addProductAttach({
    required int cartId,
    required ProductModel product,
    required int parentProductId,
  }) async {
    DraftingInvoiceTable? cart = await _findCart(cartId: cartId);
    if (cart == null) return null;

    await isar.writeTxn(() async {
      // tìm sản phẩm gốc
      ProductTable? parentProduct = await isar.productTables
          .filter()
          .idEqualTo(parentProductId)
          .itemTypeEqualTo(XItemType.main)
          .findFirst();

      if (parentProduct == null) return null;

      await _loadProductChild(parentProduct);

      // lấy danh sách gift hiện tại của product
      List<ProductTable> productsAttach = parentProduct.getAttaches;

      // thêm sản phẩm vào trong danh sách attach
      productsAttach.add(product.convertToTable(
        cartId: cartId,
        itemType: XItemType.attach,
      ));

      await _updateLinks<ProductTable>(
        parentProduct.productsAttach,
        productsAttach,
        (item) {
          item.itemType = XItemType.attach;
          return isar.productTables.put(item);
        },
      );

      // Lưu lại thông tin sản phẩm sau khi cập nhật liên kết
      await isar.productTables.put(parentProduct);
    });

    // lấy lại cart
    cart = await _findCart(cartId: cartId);

    return cart;
  }

  @override
  Future<DraftingInvoiceTable?> updateProductVoucher({
    required int cartId,
    required ProductTable product,
    VoucherModel? voucher,
  }) async {
    DraftingInvoiceTable? currentDraft = await getCart(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      product.voucher = voucher;
      await isar.productTables.put(product);
    });

    // lấy lại cart
    currentDraft = await _findCart(cartId: cartId);

    return currentDraft;
  }
}

extension DraftingStorageImplExtension on DraftingStorageImpl {
  Future<void> _updateLinks<T>(
    IsarLinks<T> link,
    List<T>? newItems,
    Future<void> Function(T item) putFn,
  ) async {
    if (newItems == null || newItems.isEmpty) {
      return; // Không làm gì nếu newItems rỗng
    }

    // Lưu từng item một thay vì gọi callAll
    for (var item in newItems) {
      await putFn(item); // Gọi putFn cho từng item
    }

    link.addAll(newItems); // Thêm liên kết mới
    await link.save(); // Lưu liên kết
  }

  Future<bool> _removeProductDependencies(ProductTable product) async {
    List<int> ids = [];

    final giftsProduct = product.getGifts;
    final attachesProduct = product.getAttaches;

    // Xóa quà tặng
    if (giftsProduct.isNotEmpty) {
      ids.addAll(giftsProduct.map((gift) => gift.id).toList());
    }

    // Xóa sản phẩm bán kèm
    if (attachesProduct.isNotEmpty) {
      ids.addAll(attachesProduct.map((attach) => attach.id).toList());
    }

    if (ids.isNotEmpty) {
      await isar.productTables.deleteAll(ids);
    }

    return true;
  }

  // Hàm khởi tạo giỏ hàng
  DraftingInvoiceTable _initializeCart(
    CartType typeCart,
    CustomerTable customer,
    AuthModel? userInfo,
  ) {
    final newCart = DraftingInvoiceTable()
      ..typeCart = typeCart
      ..createdDate = DateTime.now();

    newCart.customer.value = customer;

    switch (typeCart) {
      case CartType.retail:
      case CartType.updateBill:
      case CartType.order:
      case CartType.updateOrder:
        newCart.tradeInType = TradeInType.undefine;
        break;

      case CartType.tradeIn:
        newCart.tradeInType = TradeInType.tradeIn;
        break;

      default:
        // Xử lý các loại CartType khác nếu cần
        break;
    }

    return newCart;
  }

  // Hàm cập nhật thông tin khách hàng
  Future<CustomerTable> _updateCustomerData(
    CustomerTable customer,
    CustomerModel customerInfo,
  ) async {
    customer.copyWith(customerInfo);
    return customer;
  }

  Future<ProductTable?> _processItemsInCart({
    required DraftingInvoiceTable currentDraft,
    required ProductTable product,
    required Map<String, ProductTable> productMap,
    required ProductType productType,
  }) async {
    String productId = product.productId!;
    if (productMap.containsKey(productId)) {
      if (productType == ProductType.normal) {
        productMap[productId]!.quantity =
            productMap[productId]!.getQuantity + 1;
      } else {
        final newProduct = product..cartId = currentDraft.id;
        currentDraft.products.add(newProduct);
        productMap[productId] = newProduct;
        await isar.productTables.put(newProduct);
      }
    } else {
      final newProduct = product..cartId = currentDraft.id;
      productMap[productId] = newProduct;
      currentDraft.products.add(newProduct);
    }
    await isar.productTables.put(productMap[productId]!);
    return productMap[productId];
  }

  Future<void> _updateCartStatus(
    DraftingInvoiceTable currentCart,
    DiscountMemberType newDiscountType,
  ) async {
    currentCart.discountMemberType = newDiscountType;
  }

  Future<void> _deleteCustomerFromCart(DraftingInvoiceTable currentCart) async {
    await isar.customerTables.delete(currentCart.getCustomer!.id);
    currentCart.customer.value = null;
    await currentCart.customer.save();
  }

  Future<CustomerTable?> _findCustomer({String? phone, int? customerId}) async {
    final data = await isar.customerTables
        .filter()
        .customerIdEqualTo(customerId)
        .or()
        .phoneNoEqualTo(phone)
        .findFirst();
    return data;
  }

  Future<DraftingInvoiceTable?> _findCart({required Id cartId}) async {
    return await isar.draftingInvoiceTables
        .filter()
        .idEqualTo(cartId)
        .findFirst();
  }

  Future<void> _loadProductChild(ProductTable product) async {
    // Tải dữ liệu liên quan (quà tặng, sản phẩm kèm theo, bảo hành)
    await Future.wait([
      product.productsGift.load(),
      product.productsAttach.load(),
    ]);
  }

  Future<void> _saveCartInfo(DraftingInvoiceTable cart) async {
    await Future.wait([
      cart.customer.save(),
      cart.product.save(),
      cart.products.save(),
      cart.paymentMethods.save(),
      cart.paymentMethodsPrePay.save(),
    ]);
  }

  Future<void> _loadCartInfo(DraftingInvoiceTable cart) async {
    await Future.wait([
      cart.customer.load(),
      cart.products.load(),
      cart.product.load(),
      cart.paymentMethods.load(),
      cart.paymentMethodsPrePay.load(),
    ]);

    for (var product in cart.getProducts) {
      await _loadProductChild(product);
    }
  }
}
