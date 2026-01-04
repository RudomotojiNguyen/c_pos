import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/mixins/logger_helper.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/enum/enum.dart';
import '../../../../../../data/datasources/local_data/local_data.dart';
import '../../../../../../data/datasources/local_db/local_db.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../../data/models/employee_sub_detail_model.dart';
import '../../../../../../data/services/services.dart';
import '../../../../../utils/handle_exception.dart';
import '../../../../../utils/utils.dart';

part 'drafting_invoice_event.dart';
part 'drafting_invoice_state.dart';

class DraftingInvoiceBloc
    extends Bloc<DraftingInvoiceEvent, DraftingInvoiceState>
    with HandleException {
  final ProductServices productServices;
  final TradeInServices tradeInServices;
  final ProgramServices programServices;
  final BillServices billServices;
  final OrderServices orderServices;

  final DraftingStorage draftingStorage;

  final LoggerHelper _loggerHelper = LoggerHelper();

  DraftingInvoiceBloc({
    required this.draftingStorage,
    required this.productServices,
    required this.billServices,
    required this.orderServices,
    required this.tradeInServices,
    required this.programServices,
  }) : super(DraftingInvoiceInitial(
          totalPriceNoneDiscount: 0,
          totalDiscountPriceOfBillItem: 0,
          discountOfBill: 0,
          totalPrePayment: 0,
          finalPrice: 0,
          mustPay: 0,
          tradeInType: TradeInType.tradeIn,
          programingSelected: const {},
          estimationBuyingPrice: 0,
          productBuyingPrice: 0,
          totalCriteriaPrice: 0,
          employeeSubDetail: EmployeeSubDetailModel(),
        )) {
    /// lấy thông tin dơn nháp trong LS
    on<GetCurrentDraftEvent>(_onGetCurrentDraft);

    /// cập nhật cửa hàng lên đơn
    on<UpdateCurrentStoreEvent>(_onUpdateCurrentStore);

    /// cập nhật thông tin khách hàng trong đơn nháp
    on<UpdateCustomerInfoOfBillEvent>(_onUpdateCustomerInfoOfBill);

    /// xóa thông tin khách hàng
    on<ClearCustomerEvent>(_onClearCustomer);

    /// thêm/cập nhật sản phẩm vào đơn nháp
    on<UpdateProductEvent>(_onUpdateProduct);

    /// thêm sản phẩm từ kết quả tìm kiếm vào đơn nháp
    on<AddProductFromSearchToCartEvent>(_onAddProductFromSearchToCart);

    /// xóa sản phẩm trong đơn nháp
    on<RemoveProductOnCartEvent>(_onRemoveProductOnCart);

    /// cập nhật phương thức thanh toán
    on<UpdatePaymentMethodEvent>(_onUpdatePaymentMethod);

    /// xóa phương thức thanh toán
    on<RemovePaymentMethodEvent>(_onRemovePaymentMethod);

    /// xóa thông tin giảm giá tổng bill
    on<ClearCouponEvent>(_onClearCoupon);

    /// lưu thông tin giảm giá của toàn bill
    /// theo dạng chiết khấu tay hoặc mã coupon
    on<SetDiscountTotalBillInfoEvent>(_onSetDiscountTotalBillInfo);

    /// cập nhật thông tin ghi chú
    on<UpdateNoteEvent>(_onUpdateNote);

    /// gửi đơn lên core
    on<SubmitDraftEvent>(_onSubmitDraft);

    /// cập nhật thông tin tiêu điểm
    on<UpdateDiscountBillByPointEvent>(_onUpdateDiscountBillByPoint);

    /// cập nhật giá mua lại sản phẩm
    on<UpdateRepurchasePriceProductEvent>(_onUpdateRepurchasePriceProduct);

    /// cập nhật imei sản phẩm trong giỏ hàng
    on<UpdateImeiOfProductEvent>(_onUpdateImeiOfProduct);

    /// cập nhật ghi chú sản phẩm trong giỏ
    on<UpdateProductNoteEvent>(_onUpdateProductNote);

    /// cập nhật chiết khấu tay sản phẩm trong giỏ
    on<UpdateProductDiscountByHandEvent>(_onUpdateProductDiscountByHand);

    /// cập nhật số lượng sản phẩm trong giỏ
    on<UpdateProductQuantityEvent>(_onUpdateProductQuantity);

    /// cập nhật phí giao hàng
    on<UpdateFeeDeliveryEvent>(_onUpdateFeeDelivery);

    /// cập nhật nội dung đơn cơ bản: nguồn đơn, trạng thái,...
    on<UpdateOrderSubDetailEvent>(_onUpdateOrderSubDetail);

    /// cập nhật loại thu cũ
    on<UpdateTradeInTypeEvent>(_onUpdateTradeInType);

    /// cập nhật sản phẩm trade in
    on<UpdateProductTradeInEvent>(_onUpdateProductTradeIn);

    /// chọn tình trạng máy
    on<OnSelectProgramEvent>(_onOnSelectProgram);

    /// submit đơn định giá
    on<SubmitTradeInBillEvent>(_onSubmitTradeInBill);

    ///
    on<UpdateTradeInProgramEvent>(_onUpdateTradeInProgram);

    /// áp dụng đơn đặt trước
    on<ApplyOrderEvent>(_onApplyOrder);

    /// thêm sản phẩm quà tặng
    on<AddProductGiftEvent>(_onAddProductGift);

    /// thêm sản phẩm phụ tại
    on<AddProductAttachEvent>(_onAddProductAttach);

    /// tạo đơn nháp
    on<CreateNewDraftingInvoiceEvent>(_onCreateNewDraftingInvoice);

    /// cập nhật voucher sản phẩm
    on<UpdateProductVoucherEvent>(_onUpdateProductVoucher);

    /// cập nhật nhân viên bán hàng
    on<UpdateSalerOfBillEvent>(_onUpdateSalerOfBill);

    /// cập nhật nhân viên kỹ thuật
    on<UpdateTechnicalOfBillEvent>(_onUpdateTechnicalOfBill);

    /// cập nhật nhân viên thu ngân
    on<UpdateCashierOfBillEvent>(_onUpdateCashierOfBill);

    /// cập nhật nhân viên quản lý
    on<UpdateManagerOfBillEvent>(_onUpdateManagerOfBill);

    /// cập nhật nhân viên trợ lý
    on<UpdateAssistantOfBillEvent>(_onUpdateAssistantOfBill);

    /// cập nhật nhân viên tiếp đón
    on<UpdateReceptionistOfBillEvent>(_onUpdateReceptionistOfBill);

    /// cập nhật nhân viên giao hàng
    on<UpdateDeliveryOfBillEvent>(_onUpdateDeliveryOfBill);

    /// cập nhật nhân viên cdpk
    on<UpdateCdpkOfBillEvent>(_onUpdateCdpkOfBill);

    /// cập nhật sản phẩm combo
    on<UpdateProductComboEvent>(_onUpdateProductCombo);
  }

  FutureOr<void> _onUpdateProductCombo(
      UpdateProductComboEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      final res = await draftingStorage.updateProductCombo(
        cartId: state.currentDraftId!,
        product: event.product,
        productCombos: event.productCombos,
      );
      if (res != null) {
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateProductComboEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateCdpkOfBill(
      UpdateCdpkOfBillEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      EmployeeSubDetailModel currentEmployeeSubDetail = state.employeeSubDetail;
      currentEmployeeSubDetail = currentEmployeeSubDetail.updateCdpk(
        cdpk: event.employee,
      );
      final res = await draftingStorage.updateEmployeeSubDetail(
        cartId: state.currentDraftId!,
        employeeSubDetail: currentEmployeeSubDetail,
      );
      if (res != null) {
        emit(UpdateEmployeeSubDetailSuccess(
          state: state,
          employeeSubDetail: res.employeeSubDetail ?? EmployeeSubDetailModel(),
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateCdpkOfBillEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateSalerOfBill(
      UpdateSalerOfBillEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      EmployeeSubDetailModel currentEmployeeSubDetail = state.employeeSubDetail;
      currentEmployeeSubDetail = currentEmployeeSubDetail.updateEmployee(
        employee: event.employee,
      );
      final res = await draftingStorage.updateEmployeeSubDetail(
        cartId: state.currentDraftId!,
        employeeSubDetail: currentEmployeeSubDetail,
      );
      if (res != null) {
        emit(UpdateEmployeeSubDetailSuccess(
          state: state,
          employeeSubDetail: res.employeeSubDetail ?? EmployeeSubDetailModel(),
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateSalerOfBillEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateTechnicalOfBill(UpdateTechnicalOfBillEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      EmployeeSubDetailModel currentEmployeeSubDetail = state.employeeSubDetail;
      currentEmployeeSubDetail = currentEmployeeSubDetail.updateTechnical(
        technical: event.employee,
      );
      final res = await draftingStorage.updateEmployeeSubDetail(
        cartId: state.currentDraftId!,
        employeeSubDetail: currentEmployeeSubDetail,
      );
      if (res != null) {
        emit(UpdateEmployeeSubDetailSuccess(
          state: state,
          employeeSubDetail: res.employeeSubDetail ?? EmployeeSubDetailModel(),
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateTechnicalOfBillEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateCashierOfBill(UpdateCashierOfBillEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      EmployeeSubDetailModel currentEmployeeSubDetail = state.employeeSubDetail;
      currentEmployeeSubDetail = currentEmployeeSubDetail.updateCashier(
        cashier: event.employee,
      );
      final res = await draftingStorage.updateEmployeeSubDetail(
        cartId: state.currentDraftId!,
        employeeSubDetail: currentEmployeeSubDetail,
      );
      if (res != null) {
        emit(UpdateEmployeeSubDetailSuccess(
          state: state,
          employeeSubDetail: res.employeeSubDetail ?? EmployeeSubDetailModel(),
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateCashierOfBillEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateManagerOfBill(UpdateManagerOfBillEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      EmployeeSubDetailModel currentEmployeeSubDetail = state.employeeSubDetail;
      currentEmployeeSubDetail = currentEmployeeSubDetail.updateManager(
        manager: event.employee,
      );
      final res = await draftingStorage.updateEmployeeSubDetail(
        cartId: state.currentDraftId!,
        employeeSubDetail: currentEmployeeSubDetail,
      );
      if (res != null) {
        emit(UpdateEmployeeSubDetailSuccess(
          state: state,
          employeeSubDetail: res.employeeSubDetail ?? EmployeeSubDetailModel(),
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateManagerOfBillEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateAssistantOfBill(UpdateAssistantOfBillEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      EmployeeSubDetailModel currentEmployeeSubDetail = state.employeeSubDetail;
      currentEmployeeSubDetail = currentEmployeeSubDetail.updateAssistant(
        assistant: event.employee,
      );
      final res = await draftingStorage.updateEmployeeSubDetail(
        cartId: state.currentDraftId!,
        employeeSubDetail: currentEmployeeSubDetail,
      );
      if (res != null) {
        emit(UpdateEmployeeSubDetailSuccess(
          state: state,
          employeeSubDetail: res.employeeSubDetail ?? EmployeeSubDetailModel(),
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateAssistantOfBillEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateReceptionistOfBill(
      UpdateReceptionistOfBillEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      EmployeeSubDetailModel currentEmployeeSubDetail = state.employeeSubDetail;
      currentEmployeeSubDetail = currentEmployeeSubDetail.updateReceptionist(
        receptionist: event.employee,
      );
      final res = await draftingStorage.updateEmployeeSubDetail(
        cartId: state.currentDraftId!,
        employeeSubDetail: currentEmployeeSubDetail,
      );
      if (res != null) {
        emit(UpdateEmployeeSubDetailSuccess(
          state: state,
          employeeSubDetail: res.employeeSubDetail ?? EmployeeSubDetailModel(),
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateReceptionistOfBillEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateDeliveryOfBill(UpdateDeliveryOfBillEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      EmployeeSubDetailModel currentEmployeeSubDetail = state.employeeSubDetail;
      currentEmployeeSubDetail = currentEmployeeSubDetail.updateDelivery(
        delivery: event.employee,
      );
      final res = await draftingStorage.updateEmployeeSubDetail(
        cartId: state.currentDraftId!,
        employeeSubDetail: currentEmployeeSubDetail,
      );
      if (res != null) {
        emit(UpdateEmployeeSubDetailSuccess(
          state: state,
          employeeSubDetail: res.employeeSubDetail ?? EmployeeSubDetailModel(),
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateDeliveryOfBillEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateProductVoucher(UpdateProductVoucherEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      final res = await draftingStorage.updateProductVoucher(
        cartId: state.currentDraftId!,
        product: event.product,
        voucher: event.voucher,
      );
      if (res != null) {
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateProductVoucherEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateCurrentStore(
      UpdateCurrentStoreEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateCurrentStore(
        cartId: currentDraftId,
        store: event.store,
      );
      if (res != null) {
        emit(UpdateCurrentStoreSuccess(state: state, currentStore: res.store));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateCurrentStoreEvent', obj: e);
    }
  }

  FutureOr<void> _onCreateNewDraftingInvoice(
      CreateNewDraftingInvoiceEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      XToast.loading();
      final result = await draftingStorage.createNewCart(
          typeCart: event.typeCart, customer: event.customer);
      if (result != null) {
        emit(DraftingInvoiceCreated(state: state, currentDraftId: result));
      } else {
        XToast.showWarningMessage(message: 'Chưa thể tạo nháp hãy thử lại');
      }
    } catch (e) {
      _loggerHelper.logError(message: 'CreateNewDraftingInvoiceEvent', obj: e);
    } finally {
      XToast.closeAllLoading();
    }
  }

  FutureOr<void> _onAddProductFromSearchToCart(
    AddProductFromSearchToCartEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      XToast.loading();
      ProductTable product =
          event.product.convertToTable(itemType: XItemType.main);

      // lấy danh sách quà tặng, chương trình khuyến mãi,
      List<ProductModel> resGifts = [];
      try {
        resGifts = event.product.gifts ?? [];
      } catch (e) {
        _loggerHelper.logError(
            message: 'AddProductFromSearchToCartEvent', obj: e);
      }

      /// gọi api kiểm tra lại chương trình chiết khấu
      String productId = event.product.id ?? '';

      /// lấy id cửa hàng hiện tại
      int storeId = state.currentStore?.id ?? 0;

      /// lấy danh sách id sản phẩm trong đơn
      List<String> productIds = [];
      for (var product in state.products ?? []) {
        productIds.add(product.productId ?? '');
      }

      try {
        DiscountProgramModel? programDiscount =
            await programServices.checkProgramDiscount(
          productId: productId,
          storeId: storeId,
          productIds: productIds,
        );

        if (programDiscount != null) {
          product
            ..discountProgramId = programDiscount.id
            ..discountType = programDiscount.discountType ?? 1
            ..discountAmount = programDiscount.discountAmount ?? 0
            ..discountProgramName = programDiscount.name;
        }
      } catch (e) {
        _loggerHelper.logError(
          message: 'AddProductFromSearchToCartEvent',
          obj: e,
        );
      }

      /// format lại quà tặng
      List<ProductTable> gifts = resGifts
          .map((e) => e.convertToTable(itemType: XItemType.gift))
          .toList();

      /// gọi tới service storage để lưu product
      final res = await _addItemToCart(
        product: product,
        cartId: state.currentDraftId!,
        gifts: gifts,
      );

      if (res != null) {
        XToast.showPositiveSuccess(message: 'Đã thêm SP vào đơn');
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(
        message: 'AddProductFromSearchToCartEvent',
        obj: e,
      );
    } finally {
      XToast.closeAllLoading();
    }
  }

  FutureOr<void> _onAddProductGift(
    AddProductGiftEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      final cart = await draftingStorage.addProductGift(
        cartId: state.currentDraftId!,
        product: event.product,
        parentProductId: event.parentProductId,
      );

      if (cart != null) {
        emit(UpdateProductsSuccess(state: state, products: cart.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: cart);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'AddProductGiftEvent', obj: e);
    }
  }

  FutureOr<void> _onAddProductAttach(
    AddProductAttachEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      final cart = await draftingStorage.addProductAttach(
        cartId: state.currentDraftId!,
        product: event.product,
        parentProductId: event.parentProductId,
      );

      if (cart != null) {
        emit(UpdateProductsSuccess(state: state, products: cart.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: cart);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'AddProductAttachEvent', obj: e);
    }
  }

  FutureOr<void> _onApplyOrder(
    ApplyOrderEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      final cart = await draftingStorage.convertOrderDetailToCartStorage(
        orderDetail: event.order,
        typeCart: CartType.retail,
        currentDraftId: state.currentDraftId,
      );
      if (cart != null) {
        // nếu gán xong thì lại thông tin đơn nháp
        add(GetCurrentDraftEvent(cart.id));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'ApplyOrderEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateRepurchasePriceProduct(
    UpdateRepurchasePriceProductEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateRepurchasePriceProduct(
        cartId: currentDraftId,
        productId: event.productId,
        repurchasePrice: event.repurchasePrice,
        productType: event.productType,
      );

      if (res != null) {
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(
        message: 'UpdateRepurchasePriceProductEvent',
        obj: e,
      );
    }
  }

  FutureOr<void> _onUpdateTradeInProgram(
    UpdateTradeInProgramEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      emit(
        UpdateTradeInProgram(
          state: state,
          tradeInProgramId: event.tradeInProgramId,
        ),
      );
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateTradeInProgramEvent', obj: e);
    }
  }

  FutureOr<void> _onSubmitTradeInBill(
    SubmitTradeInBillEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;
      final cart = await draftingStorage.getCart(currentDraftId);
      if (cart == null) return;

      XToast.loading();

      List<TradeInProgramCreteriaGroupOptionModel> criteriaGroups = state
          .programingSelected.values
          .expand((innerMap) => innerMap.values)
          .toList();

      Map<String, dynamic> data = <String, dynamic>{
        'tradeInProgramId': state.tradeInProgramId,
        'imei': state.product!.getImei,
        'productId': state.product!.productId!.toInt(),
        'productBuyingPrice': state.product!.getSellingPrice,
        'finalBuyingPrice': event.finalBuyingPrice,
        'note': event.note,
        'customer': state.customer?.formatTradeInBodyData(),
        'criteriaGroups': criteriaGroups.map((e) => e.toJson()).toList(),
        'typeTradeIn': state.tradeInType.getTypeValue,
      };

      final res = await tradeInServices.saveBillTradeIn(data);

      if (res) {
        XToast.showPositiveSuccess(message: 'Đã tạo phiếu định giá thành công');

        /// xóa sau khi tạo thành công
        await draftingStorage.removeCartById(cart.id);

        emit(CreateTradeInbillSuccess(state: state));
      } else {
        emit(CreateFailed(state: state));
      }
    } catch (e) {
      handleResponseException(e, key: 'SubmitTradeInBillEvent');
      emit(CreateFailed(state: state));
    } finally {
      XToast.closeAllLoading();
    }
  }

  FutureOr<void> _onOnSelectProgram(
    OnSelectProgramEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      // Lấy tradeInProgramCreteriaGroupId từ event
      final tradeInProgramCreteriaGroupId =
          event.tradeInProgramCreteriaGroupOption.tradeInProgramCreteriaGroupId;

      // Tạo một bản sao của map programingSelected từ state hiện tại
      final programingSelected =
          Map<int, Map<int, TradeInProgramCreteriaGroupOptionModel>>.from(
        state.programingSelected,
      );

      // Kiểm tra nếu tradeInProgramCreteriaGroupId không tồn tại trong programingSelected
      if (!programingSelected.containsKey(tradeInProgramCreteriaGroupId)) {
        // Tạo một map mới với key là tradeInProgramCreteriaGroupOption.id và value là tradeInProgramCreteriaGroupOption
        final newProgram = {
          event.tradeInProgramCreteriaGroupOption.id!:
              event.tradeInProgramCreteriaGroupOption,
        };
        // Thêm vào programingSelected với key là tradeInProgramCreteriaGroupId
        programingSelected[tradeInProgramCreteriaGroupId!] = newProgram;
      } else {
        // Nếu tồn tại, gọi hàm selectTradeInProgramCreteriaGroupOption để lấy một map mới
        final updatedProgram = selectTradeInProgramCreteriaGroupOption(
          oldProgram: programingSelected[tradeInProgramCreteriaGroupId]!,
          option: event.tradeInProgramCreteriaGroupOption,
          typeSelect: event.typeSelect,
        );
        // Cập nhật programingSelected với map mới
        programingSelected[tradeInProgramCreteriaGroupId!] = updatedProgram;
      }

      // Phát ra sự kiện thành công với state mới
      emit(
        UpdateTradeInProgramSelectedSuccess(
          state: state,
          programingSelected: programingSelected,
        ),
      );

      final res = await Utils.calculatorEstimatePrice(
        product: state.product!,
        options: programingSelected,
      );

      emit(
        UpdatePriceOverViewTradeInSuccess(
          state: state,
          estimationBuyingPrice: res.$1,
          productBuyingPrice: state.productBuyingPrice,
          totalCriteriaPrice: res.$2,
        ),
      );
    } catch (e) {
      _loggerHelper.logError(message: 'OnSelectProgramEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateProductTradeIn(
    UpdateProductTradeInEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateProductTradeIn(
        cartId: currentDraftId,
        product: event.product..itemType = XItemType.main,
      );
      if (res != null) {
        emit(
          UpdateProductTradeInSuccess(state: state, product: res.getProduct),
        );

        emit(
          UpdatePriceOverViewTradeInSuccess(
            state: state,
            estimationBuyingPrice: res.getProduct?.getSellingPrice ?? 0,
            productBuyingPrice: res.getProduct?.getSellingPrice ?? 0,
            totalCriteriaPrice: 0,
          ),
        );
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateProductTradeInEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateTradeInType(
    UpdateTradeInTypeEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateTradeInType(
        cartId: currentDraftId,
        type: event.type,
      );
      if (res != null) {
        emit(
          UpdateTradeInTypeSuccess(state: state, tradeInType: res.tradeInType),
        );
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateTradeInTypeEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateOrderSubDetail(
    UpdateOrderSubDetailEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateOrderSubDetail(
        cartId: currentDraftId,
        data: event.data,
      );
      if (res != null) {
        emit(
          UpdateOrderSubDetailSuccess(
            state: state,
            orderSubDetail: res.orderSubDetail,
          ),
        );
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateOrderSubDetailEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateFeeDelivery(
    UpdateFeeDeliveryEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateDeliveryFee(
        cartId: currentDraftId,
        customerFee: event.customerFee,
        shippingCompanyFee: event.shippingCompanyFee,
      );
      if (res != null) {
        emit(
          UpdateDeliveryFeeSuccess(state: state, deliveryFee: res.deliveryFee),
        );

        /// notes: tính thêm phí giao hàng
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateFeeDeliveryEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateProductQuantity(
    UpdateProductQuantityEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final currentProductData = event.product;
      currentProductData.quantity = event.quantity;

      var res = await draftingStorage.updateProductQuantity(
        cartId: currentDraftId,
        productId: currentProductData.id,
        quantity: event.quantity,
      );

      if (currentProductData.getProductPrice < 0) {
        /// kiểm tra tổng giá sản phẩm và chiết khấu tay
        /// nếu giá trị sản phẩm nhỏ hơn 0 (bị âm)
        /// -> cập nhật chiết khấu tay là 0 cho nhập lại, tránh việc tính toán sai
        res = await draftingStorage.updateProductDiscountByHand(
          cartId: currentDraftId,
          productId: currentProductData.id,
          amount: 0,
          discountType: (currentProductData.discountByHand?.getDiscountType ??
                  XDiscountType.amount)
              .value,
        );
        XToast.showWarningMessage(
          message:
              'Chiết khấu tay đã được đưa về 0đ. Hãy nhập lại chiết khấu nếu cần',
        );
      }

      if (res != null) {
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateProductQuantityEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateProductDiscountByHand(
    UpdateProductDiscountByHandEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateProductDiscountByHand(
        cartId: currentDraftId,
        productId: event.productId,
        amount: event.amount,
        discountType: event.type.value,
      );
      if (res != null) {
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(
        message: 'UpdateProductDiscountByHandEvent',
        obj: e,
      );
    }
  }

  FutureOr<void> _onUpdateProductNote(
    UpdateProductNoteEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateNoteOfProduct(
        cartId: currentDraftId,
        note: event.productNote,
        productId: event.productId,
      );
      if (res != null) {
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateProductNoteEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateImeiOfProduct(
    UpdateImeiOfProductEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateImeiOfProduct(
        cartId: currentDraftId,
        productImei: event.imei,
        productId: event.productId,
      );
      if (res != null) {
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateImeiOfProductEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateDiscountBillByPoint(
    UpdateDiscountBillByPointEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;
      final res = await draftingStorage.updateDiscountBillByPoint(
        cartId: currentDraftId,
        discountByPoint: event.discountByPoint,
      );
      if (res != null) {
        emit(
          UpdateDiscountBillByPointSuccess(
            state: state,
            discountTotalBillByPoint: res.discountByPoint,
          ),
        );
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateDiscountBillByPointEvent', obj: e);
    }
  }

  FutureOr<void> _onSubmitDraft(
    SubmitDraftEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final cart = await draftingStorage.getCart(currentDraftId);
      if (cart == null) return;
      bool isCreateSuccess = true;

      XToast.loading();

      if (cart.validateBill && !{CartType.tradeIn}.contains(state.cartType)) {
        final formData = cart.formatBodyData();

        if (!cart.validationCart) {
          emit(CreateFailed(state: state));
          return;
        }

        /// check type of draft => send by api
        if (state.cartType == CartType.retail) {
          final response = await billServices.createBill(formData);
          isCreateSuccess = response.checkIsSuccess;
          if (response.checkIsSuccess) {
            XToast.showPositiveSuccess(message: response.getMess);
            emit(CreateBillSuccess(
                id: response.data['billNumber']?.toString() ?? ''));
          } else {
            emit(CreateFailed(state: state));
            XToast.showNegativeMessage(message: response.toString());
          }
        }
        if (state.cartType == CartType.updateBill) {
          final response = await billServices.updateBill(formData);
          isCreateSuccess = response.checkIsSuccess;
          if (response.checkIsSuccess) {
            XToast.showPositiveSuccess(message: response.getMess);
            emit(CreateBillSuccess(
                id: formData['billNumber']?.toString() ?? ''));
          } else {
            emit(CreateFailed(state: state));
            XToast.showNegativeMessage(message: response.toString());
          }
        }
        if (state.cartType == CartType.order) {
          final response = await orderServices.createOrder(formData);
          isCreateSuccess = response.checkIsSuccess;
          if (response.checkIsSuccess) {
            XToast.showPositiveSuccess(message: response.getMess);
            emit(CreateOrderSuccess(newBillNum: response.data as int));
          } else {
            emit(CreateFailed(state: state));
            XToast.showNegativeMessage(message: response.toString());
          }
        }
        if (state.cartType == CartType.updateOrder) {
          final response = await orderServices.updateOrder(formData);
          isCreateSuccess = response.checkIsSuccess;
          if (response.checkIsSuccess) {
            XToast.showPositiveSuccess(message: response.getMess);
            emit(CreateOrderSuccess(newBillNum: formData['orderId']));
          } else {
            emit(CreateFailed(state: state));
            XToast.showNegativeMessage(message: response.toString());
          }
        }
      }

      if (isCreateSuccess) {
        /// xóa sau khi tạo thành công
        draftingStorage.removeCartById(cart.id);
      }
    } catch (e) {
      handleResponseException(e, key: 'SubmitDraftEvent');
      emit(CreateFailed(state: state));
    } finally {
      XToast.closeAllLoading();
    }
  }

  FutureOr<void> _onClearCustomer(
    ClearCustomerEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res =
          await draftingStorage.clearCustomerInfo(cartId: currentDraftId);

      if (res != null) {
        emit(
          UpdateCustomerSuccess(
            state: state,
            customer: null,
            discountTotalBillByPoint: null,
          ),
        );
      }
    } catch (e) {
      _loggerHelper.logError(message: 'ClearCustomerEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateNote(
    UpdateNoteEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateBillNote(
        cartId: currentDraftId,
        saleNote: event.saleNote,
        warrantyNote: event.warrantyNote,
        customerNote: event.customerNote,
      );

      if (res != null) {
        emit(
          UpdateBillNoteSuccess(
            state: state,
            warrantyNote: res.warrantyNote,
            saleNote: res.saleNote,
            customerNote: res.customerNote,
          ),
        );
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateNoteEvent', obj: e);
    }
  }

  FutureOr<void> _onSetDiscountTotalBillInfo(
    SetDiscountTotalBillInfoEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateDiscountCoupon(
        cartId: currentDraftId,
        discountTotalBill: event.amount,
        couponDiscountCode: event.code,
      );

      if (res != null) {
        emit(
          UpdateCouponDiscountSuccess(
            state: state,
            discountTotalBill: event.amount,
            couponDiscountCode: event.code,
          ),
        );
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'SetDiscountTotalBillInfoEvent', obj: e);
    }
  }

  FutureOr<void> _onClearCoupon(
    ClearCouponEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final resUpdateStorage = await draftingStorage.updateDiscountCoupon(
        cartId: currentDraftId,
        discountTotalBill: null,
        couponDiscountCode: null,
      );

      if (resUpdateStorage != null) {
        emit(
          UpdateCouponDiscountSuccess(
            state: state,
            couponDiscountCode: null,
            discountTotalBill: null,
          ),
        );
        updateCalculatorPriceSuccess(
            emit: emit, state: state, res: resUpdateStorage);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'ClearCouponEvent', obj: e);
    }
  }

  FutureOr<void> _onRemovePaymentMethod(
    RemovePaymentMethodEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.removePaymentMethod(
        cartId: currentDraftId,
        paymentMethodId: event.id,
      );
      if (res != null) {
        emit(
          UpdatePaymentMethodSuccess(
            state: state,
            paymentByCash: res.paymentByCash,
            paymentByTransfer: res.paymentByTransfer,
            paymentByCredit: res.paymentByCredit,
            // paymentByInstallment: res.paymentByInstallment,
          ),
        );

        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'RemovePaymentMethodEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdatePaymentMethod(
    UpdatePaymentMethodEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.modifyPaymentMethod(
        cartId: currentDraftId,
        paymentMethod: event.payment,
      );

      if (res != null) {
        emit(
          UpdatePaymentMethodSuccess(
            state: state,
            paymentByCash: res.paymentByCash,
            paymentByTransfer: res.paymentByTransfer,
            paymentByCredit: res.paymentByCredit,
            // paymentByInstallment: res.paymentByInstallment,
          ),
        );

        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdatePaymentMethodEvent', obj: e);
    }
  }

  FutureOr<void> _onRemoveProductOnCart(
    RemoveProductOnCartEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.removeProductOnCart(
        cartId: currentDraftId,
        productId: event.productId,
      );
      if (res != null) {
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'RemoveProductOnCartEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateProduct(
    UpdateProductEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateItemToCart(
        product: event.product,
        cartId: currentDraftId,
        gifts: event.gifts,
        attaches: event.attaches,
      );
      if (res != null) {
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        updateCalculatorPriceSuccess(emit: emit, state: state, res: res);
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateProductEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateCustomerInfoOfBill(
    UpdateCustomerInfoOfBillEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final CustomerModel customer = event.customer ?? CustomerModel();

      // cập nhật thông tin khách hàng vào local db
      final res = await draftingStorage.updateCustomerInfo(
        customerInfo: customer,
        cartId: currentDraftId,
      );
      if (res != null) {
        emit(
          UpdateCustomerSuccess(
            state: state,
            customer: res.getCustomer,
            discountTotalBillByPoint: res.discountByPoint,
          ),
        );
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateCustomerInfoOfBillEvent', obj: e);
    }
  }

  FutureOr<void> _onGetCurrentDraft(
    GetCurrentDraftEvent event,
    Emitter<DraftingInvoiceState> emit,
  ) async {
    try {
      emit(IsGettingDetail());
      final res = await draftingStorage.getCart(event.currentDraftId);
      if (res == null) {
        emit(GetCurrentDraftDataError(state: state));
      }
      emit(
        GetCurrentDraftDataSuccess(
          state: state,
          employeeSubDetail: res!.employeeSubDetail ?? EmployeeSubDetailModel(),
          orderId: res.orderId,
          cartType: res.typeCart,
          billNumber: res.billNumber,
          currentDraftId: res.id,
          customer: res.getCustomer,
          products: res.getProducts,
          billId: res.billId,
          customerNote: res.customerNote,
          warrantyNote: res.warrantyNote,
          saleNote: res.saleNote,
          discountTotalBillByPoint: res.discountByPoint,
          isDefaultInfo: res.isDefaultInfo,
          vatChecked: res.vatChecked,
          isCountPoint: res.isCountPoint,
          discountTotalBill: res.discountTotalBill,
          couponDiscountCode: res.couponDiscountCode,
          productTradeIn: res.getProduct,
          productImei: res.productImei,
          isEstimateCost: res.isEstimateCost,
          isSoldByCompany: res.isSoldByCompany,
          method: res.method,
          //
          totalPriceNoneDiscount: res.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: res.totalDiscountPriceOfBillItem,
          discountOfBill: res.getDiscountOfTotalBill,
          totalPrePayment: res.calculatorTotalPrePayment,
          paymentByCash: res.paymentByCash,
          paymentByTransfer: res.paymentByTransfer,
          paymentByCredit: res.paymentByCredit,
          // paymentByInstallment: res.paymentByInstallment,
          finalPrice: res.calculatorFinalPrice,
          mustPay: res.calculatorMustPay,
          //
          deliveryFee: res.deliveryFee,
          orderSubDetail: res.orderSubDetail,
          tradeInType: res.tradeInType,
          product: res.getProduct,
          programingSelected: const {},
          estimationBuyingPrice: 0,
          productBuyingPrice: 0,
          totalCriteriaPrice: 0,
          currentStore: res.store,
        ),
      );

      emit(
        UpdatePriceOverViewTradeInSuccess(
          state: state,
          estimationBuyingPrice: res.getProduct?.getSellingPrice ?? 0,
          productBuyingPrice: res.getProduct?.getSellingPrice ?? 0,
          totalCriteriaPrice: 0,
        ),
      );
    } catch (e) {
      emit(GetCurrentDraftDataError(state: state));
      _loggerHelper.logError(message: 'GetCurrentDraftEvent', obj: e);
    }
  }
}

extension DraftDetailBlocExtension on DraftingInvoiceBloc {
  Future<DraftingInvoiceTable?> _addItemToCart({
    required ProductTable product,
    required int cartId,
    List<ProductTable>? gifts,
    List<ProductTable>? attaches,
  }) async {
    return await draftingStorage.addItemToCart(
      product: product,
      cartId: cartId,
      gifts: gifts,
      attaches: attaches,
    );
  }

  Map<int, TradeInProgramCreteriaGroupOptionModel>
      selectTradeInProgramCreteriaGroupOption({
    required Map<int, TradeInProgramCreteriaGroupOptionModel> oldProgram,
    required TradeInProgramCreteriaGroupOptionModel option,
    required TypeSelect typeSelect,
  }) {
    // Tạo một bản sao của map programingSelected từ state hiện tại
    final programingSelected =
        Map<int, TradeInProgramCreteriaGroupOptionModel>.from(oldProgram);
    // Lấy id của option từ sự kiện
    final optionId = option.id;

    if (optionId == null) return programingSelected;

    if (typeSelect == TypeSelect.multiple) {
      // Kiểm tra nếu loại lựa chọn là multiple
      // Nếu optionId đã tồn tại trong map, xóa nó
      if (programingSelected.containsKey(optionId)) {
        programingSelected.remove(optionId);
      } else {
        // Thêm optionId vào map
        programingSelected[optionId] = option;
      }
    } else if (typeSelect == TypeSelect.single) {
      // Kiểm tra nếu optionId đã tồn tại, xóa nó
      if (programingSelected.containsKey(optionId)) {
        programingSelected.remove(optionId);
      } else {
        // Nếu không tồn tại, xóa tất cả và thêm lại duy nhất option
        programingSelected.clear();
        programingSelected[optionId] = option;
      }
    }

    return programingSelected;
  }

  void updateCalculatorPriceSuccess({
    required Emitter<DraftingInvoiceState> emit,
    required DraftingInvoiceState state,
    required DraftingInvoiceTable res,
  }) {
    emit(
      UpdateCalculatorPriceSuccess(
        state: state,
        totalPriceNoneDiscount: res.totalPriceNoneDiscount,
        totalDiscountPriceOfBillItem: res.totalDiscountPriceOfBillItem,
        discountOfBill: res.getDiscountOfTotalBill,
        totalPrePayment: res.calculatorTotalPrePayment,
        finalPrice: res.calculatorFinalPrice,
        mustPay: res.calculatorMustPay,
      ),
    );
  }
}
