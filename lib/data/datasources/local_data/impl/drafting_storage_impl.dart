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
    return await _getDraftingInvoice(draftId);
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
  Future<DraftingInvoiceTable?> updateDeliveryFee({
    required int cartId,
    int? customerFee,
    int? shippingCompanyFee,
  }) async {
    DraftingInvoiceTable? currentDraft = await _getDraftingInvoice(cartId);
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
    DraftingInvoiceTable? currentDraft = await _getDraftingInvoice(cartId);
    if (currentDraft == null) return null;

    await isar.writeTxn(() async {
      currentDraft.orderSubDetail = data;
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
}

extension DraftingStorageImplExtension on DraftingStorageImpl {
  /// INTERNAL METHODS

  /// khởi tạo đơn hàng
  DraftingInvoiceTable _initializeCart(
      CartType typeCart, CustomerTable customer, AuthModel? userInfo) {
    final newCart = DraftingInvoiceTable()
      ..typeCart = typeCart
      ..createdDate = DateTime.now();

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
      await isar.customerTables.delete(element.getCustomer!.id);
    }

    // xóa product
    if (element.getProduct != null) {
      await isar.productTables.delete(element.getProduct!.id);
    }
    if (element.getProducts.isNotEmpty) {
      for (var product in element.getProducts) {
        await isar.productTables.delete(product.id);
      }
    }

    // xóa payment methods
    if (element.getPaymentMethods.isNotEmpty) {
      for (var paymentMethod in element.getPaymentMethods) {
        await isar.paymentMethodTables.delete(paymentMethod.id);
      }
    }

    // xóa payment methods pre pay
    if (element.getPaymentMethodsPrePay.isNotEmpty) {
      for (var paymentMethod in element.getPaymentMethodsPrePay) {
        await isar.paymentMethodTables.delete(paymentMethod.id);
      }
    }

    await isar.draftingInvoiceTables.delete(element.id);
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
}
