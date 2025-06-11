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
  Future<List<DraftingInvoiceTable>> getDraftingInvoiceList() async {
    final drafts = await isar.draftingInvoiceTables.where().findAll();

    for (var draft in drafts) {
      await _loadDataInsideDraftingInvoice(draft);
    }

    return drafts;
  }

  @override
  Future<void> clearCart() async {
    /// xóa toàn bộ đơn nháp
    /// 1. lấy danh sách đơn nháp
    /// 2. lặp từng đơn nháp và xóa tất cả những thứ liên quan được liên kết (customer, product, ...)
    /// 3. xóa đơn nháp
    final listDraftingInvoice = await getDraftingInvoiceList();
    for (var element in listDraftingInvoice) {
      await _deleteDraftingInvoice(element: element);
    }
  }

  @override
  Future<int?> createDraftingInvoice({required CartType cartType}) async {
    // Tạo khách hàng mới
    final newCustomer = CustomerTable();

    // Lấy thông tin người dùng
    final AuthModel? employeeSupport = getIt<AuthBloc>().state.userInfo;

    DraftingInvoiceTable newCart = DraftingInvoiceTable();

    await isar.writeTxn(() async {
      // lưu thông tin khách hàng
      await isar.customerTables.put(newCustomer);

      // Tạo giỏ hàng mới
      newCart = _initializeCart(cartType, newCustomer, employeeSupport);

      // lưu thông tin đơn hàng
      await isar.draftingInvoiceTables.put(newCart); // Lưu thông tin giỏ hàng

      // Lưu liên kết
      await newCart.customer.save();
      await newCart.products.save();
    });

    return newCart.id;
  }

  @override
  Future<void> deleteDraftingInvoice({required int draftId}) async {
    final element = await _getDraftingInvoice(draftId);
    if (element != null) {
      await isar.writeTxn(() async {
        await isar.draftingInvoiceTables.delete(draftId);
      });
    }
  }

  @override
  Future<DraftingInvoiceTable?> getDraftingInvoice(
      {required int draftId}) async {
    final cart = await _getDraftingInvoice(draftId);

    if (cart != null) {
      // Tải các dữ liệu liên quan đến giỏ hàng
      await _loadDataInsideDraftingInvoice(cart);
    }
    return cart;
  }

  @override
  Future<DraftingInvoiceTable?> clearCustomerInfo({
    required int cartId,
  }) async {
    var currentCart = await _getDraftingInvoice(cartId);
    if (currentCart == null) return null;
    await isar.writeTxn(() async {
      await _deleteCustomerFromCart(currentCart);
      // await _updateCartStatus(currentCart, noneDiscountType);
      await isar.draftingInvoiceTables.put(currentCart);
    });
    return currentCart;
  }

  @override
  Future<DraftingInvoiceTable?> updateCustomerInfo(
      {required int cartId, required CustomerModel customerInfo}) async {
    // Lấy giỏ hàng hiện tại
    var currentCart = await _getDraftingInvoice(cartId);
    if (currentCart == null) return null;
    // Khởi động transaction để thực hiện các cập nhật
    await isar.writeTxn(() async {
      // Lấy thông tin khách hàng từ giỏ hàng
      var customer = currentCart.getCustomer;
      late CustomerTable newCustomerData;

      if (customer != null) {
        // Cập nhật thông tin khách hàng
        newCustomerData = await _updateCustomerData(customer, customerInfo);
        currentCart.customer.value = newCustomerData;
      } else {
        // Nếu không có khách hàng trong giỏ hàng, tạo mới
        final newCustomer = CustomerTable();
        newCustomerData = await _updateCustomerData(newCustomer, customerInfo);
        currentCart.customer.value = newCustomerData;
      }

      // Lưu lại khách hàng đã cập nhật vào cơ sở dữ liệu
      await isar.customerTables.put(newCustomerData);
      await currentCart.customer.save();

      // Lưu giỏ hàng sau khi cập nhật
      await isar.draftingInvoiceTables.put(currentCart);
    });

    return currentCart;
  }

  @override
  Future<DraftingInvoiceTable?> updateSaleInfo({
    required int cartId,
    required EmployeeModel saleInfo,
  }) async {
    var currentCart = await _getDraftingInvoice(cartId);
    if (currentCart == null) return null;

    await isar.writeTxn(() async {
      currentCart.saleInfo = saleInfo;
      await isar.draftingInvoiceTables.put(currentCart);
    });
    return currentCart;
  }

  @override
  Future<DraftingInvoiceTable?> updateTechInfo({
    required int cartId,
    required EmployeeModel techInfo,
  }) async {
    var currentCart = await _getDraftingInvoice(cartId);
    if (currentCart == null) return null;

    await isar.writeTxn(() async {
      currentCart.technicalInfo = techInfo;
      await isar.draftingInvoiceTables.put(currentCart);
    });
    return currentCart;
  }

  @override
  Future<DraftingInvoiceTable?> updateBillNote(
      {required int cartId, String? saleNote, String? warrantyNote}) async {
    DraftingInvoiceTable? currentDraft = await _getDraftingInvoice(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.saleNote = saleNote;
      currentDraft.warrantyNote = warrantyNote;
      await isar.draftingInvoiceTables.put(currentDraft);
    });
    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateDiscountCoupon({
    required int cartId,
    double? discountTotalBill,
    String? couponDiscountCode,
  }) async {
    DraftingInvoiceTable? currentDraft = await _getDraftingInvoice(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.discountTotalBill = discountTotalBill;
      currentDraft.couponDiscountCode = couponDiscountCode;
      await isar.draftingInvoiceTables.put(currentDraft);
    });
    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> updateDiscountBillByPoint({
    required int cartId,
    OtpCustomerPointModel? discountByPoint,
  }) async {
    DraftingInvoiceTable? currentDraft = await _getDraftingInvoice(cartId);
    CustomerTable? customerTable = currentDraft?.getCustomer;

    if (currentDraft == null || customerTable == null) return null;

    /// todo: xóa chiết khấu điểm nếu cần
    // currentDraft = await deleteDiscountDMemItemsToCart(cartId: cartId);

    await isar.writeTxn(() async {
      customerTable.discountByPoint = discountByPoint;
      await isar.customerTables.put(customerTable);

      currentDraft.discountMemberType = DiscountMemberType.point;

      await isar.draftingInvoiceTables.put(currentDraft);
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> removePaymentMethod(
      {required int cartId, required int paymentMethodId}) async {
    DraftingInvoiceTable? currentDraft = await _getDraftingInvoice(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      await isar.paymentMethodTables.delete(paymentMethodId);
      currentDraft.paymentMethods
          .removeWhere((element) => element.id == paymentMethodId);

      // Lưu lại giỏ hàng với phương thức thanh toán mới
      await isar.draftingInvoiceTables.put(currentDraft);
      await currentDraft.paymentMethods
          .save(); // Lưu các liên kết với phương thức thanh toán
    });

    return currentDraft;
  }

  @override
  Future<DraftingInvoiceTable?> modifyPaymentMethod({
    required int cartId,
    required PaymentMethodTable paymentMethod,
  }) async {
    // Lấy giỏ hàng hiện tại
    DraftingInvoiceTable? currentDraft = await _getDraftingInvoice(cartId);
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
  Future<DraftingInvoiceTable?> updateTradeInType(
      {required TradeInType type, required int cartId}) async {
    DraftingInvoiceTable? currentDraft = await _getDraftingInvoice(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.tradeInType = type;
      await isar.draftingInvoiceTables.put(currentDraft);
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
    List<VoucherTable>? vouchers,
  }) async {
    DraftingInvoiceTable? currentDraft = await _getDraftingInvoice(cartId);
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
          item.productChildType = ProductType.gift;
          return isar.productTables.put(item);
        });
        await _updateLinks<ProductTable>(
          processedProduct.productsAttach,
          attaches,
          (item) {
            item.productChildType = ProductType.attach;
            return isar.productTables.put(item);
          },
        );
        await _updateLinks<ProductTable>(
          processedProduct.productsWarranty,
          warranties,
          (item) {
            item.productChildType = ProductType.warranty;
            return isar.productTables.put(item);
          },
        );
        await _updateLinks<VoucherTable>(
          processedProduct.vouchers,
          vouchers,
          (item) => isar.voucherTables.put(item),
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
  Future<DraftingInvoiceTable?> removeProductOnCart({
    required int productId,
    required int cartId,
  }) async {
    DraftingInvoiceTable? currentDraft =
        await getDraftingInvoice(draftId: cartId);
    if (currentDraft == null) return null;

    for (final product in currentDraft.products) {
      await product.replacedWarrantyProduct.load();
    }

    await isar.writeTxn(() async {
      List<ProductTable> productsToRemove = [];
      List<VoucherTable> vouchersToRemove = [];

      // Duyệt qua tất cả sản phẩm trong giỏ hàng
      currentDraft.products.removeWhere((product) {
        if (product.id == productId) {
          productsToRemove.add(product);

          // Xóa toàn bộ liên kết của sản phẩm
          productsToRemove.addAll(product.getGifts);
          productsToRemove.addAll(product.getAttaches);
          productsToRemove.addAll(product.getWarranties);
          vouchersToRemove.addAll(product.getVouchers);

          product.productsGift.clear();
          product.productsAttach.clear();
          product.productsWarranty.clear();
          product.vouchers.clear();
          product.vouchersSelected?.clear();

          // xóa vouchers
          for (var voucher in product.vouchers) {
            isar.voucherTables.deleteSync(voucher.id); // Use synchronous delete
          }

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

        product.productsWarranty.removeWhere((warranty) {
          if (warranty.id == productId) {
            productsToRemove.add(warranty);
            return true;
          }
          return false;
        });

        /// xử lý kiểm tra replacedWarrantyProduct có id giống vs productId
        /// nếu giống đưa cái replacedWarrantyProduct vào productsToRemove để xoá ở hàm dưới
        /// /// todo: sửa lại chỗ này
        if (product.replacedWarrantyProduct.value?.id == productId) {
          productsToRemove.add(product.replacedWarrantyProduct.value!);
          product.replacedWarrantyProduct.value = null;
        }

        return false;
      });

      // lưu lại liên kết
      await Future.wait([
        for (var product in currentDraft.products)
          Future.wait([
            product.productsGift.save(),
            product.productsAttach.save(),
            product.productsWarranty.save(),
          ]),
      ]);

      // Xóa toàn bộ sản phẩm trong danh sách cần xóa khỏi database
      await isar.productTables.deleteAll(
        productsToRemove.map((e) => e.id).toList(),
      );
      await isar.voucherTables.deleteAll(
        vouchersToRemove.map((e) => e.id).toList(),
      );

      // Cập nhật lại giỏ hàng
      await isar.draftingInvoiceTables.put(currentDraft);
      await currentDraft.products.save();
    });

    return currentDraft;
  }
}

extension DraftingStorageImplExtension on DraftingStorageImpl {
  /// INTERNAL METHODS

  /// khởi tạo đơn hàng
  DraftingInvoiceTable _initializeCart(
      CartType typeCart, CustomerTable customer, AuthModel? userInfo) {
    final newCart = DraftingInvoiceTable()
      ..typeCart = typeCart
      ..createdDate = DateTime.now()
      ..tradeInType = TradeInType.tradeIn;

    newCart.customer.value = customer;

    switch (typeCart) {
      case CartType.retail:
      case CartType.updateBill:
      case CartType.order:
      case CartType.updateOrder:
        newCart
          ..saleInfo = userInfo?.employee
          ..technicalInfo = userInfo?.employee;
        break;

      case CartType.tradeIn:
        break;

      default:
        // Xử lý các loại CartType khác nếu cần
        break;
    }

    return newCart;
  }

  /// xóa đơn hàng
  Future<void> _deleteDraftingInvoice(
      {required DraftingInvoiceTable element}) async {
    // xóa customer
    if (element.getCustomer != null) {
      await isar.writeTxn(
        () async {
          await isar.customerTables.delete(element.getCustomer!.id);
        },
      );
    }

    // xóa product
    if (element.getProduct != null) {
      await isar.writeTxn(
        () async {
          await isar.productTables.delete(element.getProduct!.id);
        },
      );
    }
    if (element.getProducts.isNotEmpty) {
      for (var product in element.getProducts) {
        await isar.writeTxn(
          () async {
            await isar.productTables.delete(product.id);
          },
        );
      }
    }

    // xóa payment methods
    if (element.getPaymentMethods.isNotEmpty) {
      for (var paymentMethod in element.getPaymentMethods) {
        await isar.writeTxn(
          () async {
            await isar.paymentMethodTables.delete(paymentMethod.id);
          },
        );
      }
    }

    // xóa payment methods pre pay
    if (element.getPaymentMethodsPrePay.isNotEmpty) {
      for (var paymentMethod in element.getPaymentMethodsPrePay) {
        await isar.writeTxn(
          () async {
            await isar.paymentMethodTables.delete(paymentMethod.id);
          },
        );
      }
    }

    await isar.writeTxn(
      () async {
        await isar.draftingInvoiceTables.delete(element.id);
      },
    );
  }

  /// lấy thông tin mộtnđơn hàng
  Future<DraftingInvoiceTable?> _getDraftingInvoice(int draftId) async {
    final draft = await isar.draftingInvoiceTables.get(draftId);

    if (draft != null) {
      await _loadDataInsideDraftingInvoice(draft);
    }

    return draft;
  }

  /// load các thông tin bên trong đơn hàng
  Future<void> _loadDataInsideDraftingInvoice(
      DraftingInvoiceTable element) async {
    await Future.wait([
      // lấy customer
      element.customer.load(),

      // lấy product
      element.products.load(),
      element.product.load(),

      // lấy payment methods
      element.paymentMethods.load(),
      element.paymentMethodsPrePay.load(),
    ]);

    for (var product in element.getProducts) {
      await _loadProductChild(product);
    }
  }

  /// xóa khách hàng khỏi đơn hàng
  Future<void> _deleteCustomerFromCart(DraftingInvoiceTable currentCart) async {
    await isar.customerTables.delete(currentCart.getCustomer!.id);
    currentCart.customer.value = null;
    await currentCart.customer.save();
  }

  /// cập nhật thông tin khách hàng
  Future<CustomerTable> _updateCustomerData(
      CustomerTable customer, CustomerModel customerInfo) async {
    if (customerInfo.id == null) {
      // Xóa thông tin khách hàng nếu id là null
      customer.clearCustomerData();
    } else {
      // Cập nhật thông tin khách hàng
      customer.copyWith(customerInfo);
    }
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

  Future<void> _loadProductChild(ProductTable product) async {
    // Tải dữ liệu liên quan (quà tặng, sản phẩm kèm theo, bảo hành)
    await Future.wait([
      product.productsGift.load(),
      product.productsWarranty.load(),
      product.vouchers.load(),
      product.productsAttach.load(),
    ]);
  }
}
