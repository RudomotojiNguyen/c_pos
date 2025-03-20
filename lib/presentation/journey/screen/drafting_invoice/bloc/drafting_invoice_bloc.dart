import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:c_pos/presentation/mixins/logger_helper.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:equatable/equatable.dart';

import '../../../../../common/enum/enum.dart';
import '../../../../../data/datasources/local_data/local_data.dart';
import '../../../../../data/datasources/local_db/local_db.dart';
import '../../../../../data/models/customer_model.dart';
import '../../../../../data/models/delivery_fee_model.dart';
import '../../../../../data/models/employee_model.dart';
import '../../../../../data/models/order_sub_detail_model.dart';
import '../../../../../data/models/otp_customer_point_model.dart';

part 'drafting_invoice_event.dart';
part 'drafting_invoice_state.dart';

class DraftingInvoiceBloc
    extends Bloc<DraftingInvoiceEvent, DraftingInvoiceState> {
  final DraftingStorage draftingStorage;
  final LoggerHelper _loggerHelper = LoggerHelper();

  DraftingInvoiceBloc({required this.draftingStorage})
      : super(const DraftingInvoiceInitial(
            draftingInvoiceList: [], products: [])) {
    // lấy danh sách đơn nháp
    on<GetDraftingInvoiceListEvent>(_onGetDraftingInvoiceList);
    // tạo mới đơn nháp
    on<CreateNewDraftingInvoiceEvent>(_onCreateNewDraftingInvoice);
    // xóa đơn nháp
    on<RemoveDraftingInvoiceEvent>(_onRemoveDraftingInvoice);
    // lấy chi tiết đơn nháp
    on<GetDraftingInvoiceDetailEvent>(_onGetDraftingInvoiceDetail);
    // cập nhật khách hàng
    on<UpdateCustomerEvent>(_onUpdateCustomer);
    // xóa khách hàng
    on<ClearCustomerEvent>(_onClearCustomer);
    // cập nhật chi tiết đơn nháp
    on<UpdateDraftEvent>(_onUpdateDraft);
    // cập nhật thông tin người bán hàng
    on<UpdateSaleInfoOfBillEvent>(_onUpdateSaleInfoOfBill);
    // cập nhật thông tin kỹ thuật
    on<UpdateTechInfoOfBillEvent>(_onUpdateTechInfoOfBill);
    // cập nhật ghi chú
    on<UpdateNoteEvent>(_onUpdateNote);
    // cập nhật phí giao hàng
    on<UpdateDeliveryFeeEvent>(_onUpdateDeliveryFee);
    // cập nhật chi tiết đơn
    on<UpdateOrderSubDetailEvent>(_onUpdateOrderSubDetail);
    // cập nhật mã coupon và số tiền giảm
    on<SetDiscountTotalBillInfoEvent>(_onSetDiscountTotalBillInfo);
    // xóa mã coupon và số tiền giảm
    on<ClearCouponEvent>(_onClearCoupon);
    // cập nhật chiết khấu điểm
    on<UpdateDiscountBillByPointEvent>(_onUpdateDiscountBillByPoint);
    // xóa phương thức thanh toán
    on<RemovePaymentMethodEvent>(_onRemovePaymentMethod);
    // cập nhật phương thức thanh toán
    on<UpdatePaymentMethodEvent>(_onUpdatePaymentMethod);
    // cập nhật loại đơn nháp
    on<UpdateTradeInTypeEvent>(_onUpdateTradeInType);
  }

  FutureOr<void> _onUpdateTradeInType(
      UpdateTradeInTypeEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateTradeInType(
        cartId: currentDraftId,
        type: event.type,
      );
      if (res != null) {
        emit(UpdateTradeInTypeSuccess(
            state: state, tradeInType: res.tradeInType));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateTradeInTypeEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdatePaymentMethod(UpdatePaymentMethodEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.modifyPaymentMethod(
          cartId: currentDraftId, paymentMethod: event.payment);

      if (res != null) {
        emit(UpdatePaymentMethodSuccess(
          state: state,
          paymentByCash: res.paymentByCash,
          paymentByTransfer: res.paymentByTransfer,
          paymentByCredit: res.paymentByCredit,
          paymentByInstallment: res.paymentByInstallment,
        ));

        emit(UpdateCalculatorPriceSuccess(
          state: state,
          totalPriceNoneDiscount: res.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: res.totalDiscountPriceOfBillItem,
          discountOfBill: res.getDiscountOfTotalBill,
          totalPrePayment: res.calculatorTotalPrePayment,
          finalPrice: res.calculatorFinalPrice,
          mustPay: res.calculatorMustPay,
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdatePaymentMethodEvent', obj: e);
    }
  }

  FutureOr<void> _onRemovePaymentMethod(RemovePaymentMethodEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.removePaymentMethod(
          cartId: currentDraftId, paymentMethodId: event.id);
      if (res != null) {
        emit(UpdatePaymentMethodSuccess(
          state: state,
          paymentByCash: res.paymentByCash,
          paymentByTransfer: res.paymentByTransfer,
          paymentByCredit: res.paymentByCredit,
          paymentByInstallment: res.paymentByInstallment,
        ));

        emit(UpdateCalculatorPriceSuccess(
          state: state,
          totalPriceNoneDiscount: res.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: res.totalDiscountPriceOfBillItem,
          discountOfBill: res.getDiscountOfTotalBill,
          totalPrePayment: res.calculatorTotalPrePayment,
          finalPrice: res.calculatorFinalPrice,
          mustPay: res.calculatorMustPay,
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'RemovePaymentMethodEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateDiscountBillByPoint(
      UpdateDiscountBillByPointEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;
      final res = await draftingStorage.updateDiscountBillByPoint(
          cartId: currentDraftId, discountByPoint: event.discountByPoint);
      if (res != null) {
        emit(UpdateDiscountBillByPointSuccess(
          state: state,
          discountTotalBillByPoint: res.discountByPoint,
          // customerDMemInfo: res.customerDMemInfo,
        ));
        emit(UpdateProductsSuccess(state: state, products: res.getProducts));
        emit(UpdateCalculatorPriceSuccess(
          state: state,
          totalPriceNoneDiscount: res.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: res.totalDiscountPriceOfBillItem,
          discountOfBill: res.getDiscountOfTotalBill,
          totalPrePayment: res.calculatorTotalPrePayment,
          finalPrice: res.calculatorFinalPrice,
          mustPay: res.calculatorMustPay,
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateDiscountBillByPointEvent', obj: e);
    }
  }

  FutureOr<void> _onClearCoupon(
      ClearCouponEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final resUpdateStorage = await draftingStorage.updateDiscountCoupon(
        cartId: currentDraftId,
        discountTotalBill: null,
        couponDiscountCode: null,
      );

      if (resUpdateStorage != null) {
        emit(UpdateCouponDiscountSuccess(
            state: state, couponDiscountCode: null, discountTotalBill: null));
        emit(UpdateCalculatorPriceSuccess(
          state: state,
          totalPriceNoneDiscount: resUpdateStorage.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem:
              resUpdateStorage.totalDiscountPriceOfBillItem,
          discountOfBill: resUpdateStorage.getDiscountOfTotalBill,
          totalPrePayment: resUpdateStorage.calculatorTotalPrePayment,
          finalPrice: resUpdateStorage.calculatorFinalPrice,
          mustPay: resUpdateStorage.calculatorMustPay,
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'ClearCouponEvent', obj: e);
    }
  }

  FutureOr<void> _onSetDiscountTotalBillInfo(
      SetDiscountTotalBillInfoEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateDiscountCoupon(
        cartId: currentDraftId,
        discountTotalBill: event.amount,
        couponDiscountCode: event.code,
      );

      if (res != null) {
        emit(UpdateCouponDiscountSuccess(
          state: state,
          discountTotalBill: event.amount,
          couponDiscountCode: event.code,
        ));
        emit(UpdateCalculatorPriceSuccess(
          state: state,
          totalPriceNoneDiscount: res.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: res.totalDiscountPriceOfBillItem,
          discountOfBill: res.getDiscountOfTotalBill,
          totalPrePayment: res.calculatorTotalPrePayment,
          finalPrice: res.calculatorFinalPrice,
          mustPay: res.calculatorMustPay,
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'SetDiscountTotalBillInfoEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateOrderSubDetail(UpdateOrderSubDetailEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateOrderSubDetail(
        cartId: currentDraftId,
        data: event.data,
      );
      if (res != null) {
        emit(UpdateOrderSubDetailSuccess(
            state: state, orderSubDetail: res.orderSubDetail));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateOrderSubDetailEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateDeliveryFee(
      UpdateDeliveryFeeEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateDeliveryFee(
        cartId: currentDraftId,
        customerFee: event.customerFee,
        shippingCompanyFee: event.shippingCompanyFee,
      );
      if (res != null) {
        emit(UpdateDeliveryFeeSuccess(
            state: state, deliveryFee: res.deliveryFee));

        /// notes: tính thêm phí giao hàng
        emit(UpdateCalculatorPriceSuccess(
          state: state,
          totalPriceNoneDiscount: res.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: res.totalDiscountPriceOfBillItem,
          discountOfBill: res.getDiscountOfTotalBill,
          totalPrePayment: res.calculatorTotalPrePayment,
          finalPrice: res.calculatorFinalPrice,
          mustPay: res.calculatorMustPay,
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateDeliveryFee', obj: e);
    }
  }

  FutureOr<void> _onUpdateNote(
      UpdateNoteEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateBillNote(
        cartId: currentDraftId,
        saleNote: event.saleNote,
        warrantyNote: event.warrantyNote,
      );

      if (res != null) {
        emit(UpdateNoteSuccess(
          state: state,
          warrantyNote: event.warrantyNote,
          saleNote: event.saleNote,
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateNoteEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateTechInfoOfBill(UpdateTechInfoOfBillEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateTechInfo(
        techInfo: event.employee,
        cartId: currentDraftId,
      );
      if (res != null) {
        emit(UpdateTechInfoSuccess(
            state: state, technicalInfo: res.technicalInfo));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateTechInfoOfBill', obj: e);
    }
  }

  FutureOr<void> _onUpdateSaleInfoOfBill(UpdateSaleInfoOfBillEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res = await draftingStorage.updateSaleInfo(
        saleInfo: event.employee,
        cartId: currentDraftId,
      );
      if (res != null) {
        emit(UpdateSaleInfoSuccess(state: state, saleInfo: res.saleInfo));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateSaleInfoOfBill', obj: e);
    }
  }

  FutureOr<void> _onUpdateDraft(
      UpdateDraftEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      emit(GetDraftingInvoiceLoading(state: state));
      List<DraftingInvoiceTable> currentCart = state.draftingInvoiceList;
      currentCart[event.index] = event.cartDetail;
      emit(GetDraftingInvoiceSuccess(
          state: state, draftingInvoiceList: currentCart));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateDraftEvent', obj: e);
    }
  }

  FutureOr<void> _onClearCustomer(
      ClearCustomerEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      int? currentDraftId = state.currentDraftId;
      if (currentDraftId == null) return;

      final res =
          await draftingStorage.clearCustomerInfo(cartId: currentDraftId);

      if (res != null) {
        emit(UpdateCustomerSuccess(
          state: state,
          customer: null,
        ));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'ClearCustomerEvent', obj: e);
    }
  }

  FutureOr<void> _onUpdateCustomer(
      UpdateCustomerEvent event, Emitter<DraftingInvoiceState> emit) async {
    try {
      // 1. cập nhật vào storage
      final res = await draftingStorage.updateCustomerInfo(
          cartId: state.currentDraftId ?? 0, customerInfo: event.customer);
      // 2. cập nhật lại state
      emit(UpdateCustomerSuccess(state: state, customer: res?.getCustomer));
    } catch (e) {
      _loggerHelper.logError(message: 'UpdateCustomerEvent', obj: e);
    }
  }

  FutureOr<void> _onGetDraftingInvoiceDetail(
      GetDraftingInvoiceDetailEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      emit(GetDraftingInvoiceDetailLoading(state: state));
      final result =
          await draftingStorage.getDraftingInvoice(draftId: event.id);
      if (result != null) {
        emit(GetDraftingInvoiceDetailSuccess(
          state: state,
          currentDraftId: event.id,
          cartType: result.typeCart,
          products: result.getProducts,
          customer: result.getCustomer,
          warrantyNote: result.warrantyNote,
          saleNote: result.saleNote,
          deliveryFee: result.deliveryFee,
          orderSubDetail: result.orderSubDetail,
          discountTotalBill: result.discountTotalBill,
          couponDiscountCode: result.couponDiscountCode,
          discountTotalBillByPoint: result.discountByPoint,
          mustPay: result.calculatorMustPay,
          totalPriceNoneDiscount: result.totalPriceNoneDiscount,
          totalDiscountPriceOfBillItem: result.totalDiscountPriceOfBillItem,
          discountOfBill: result.getDiscountOfTotalBill,
          totalPrePayment: result.calculatorTotalPrePayment,
          finalPrice: result.calculatorFinalPrice,
          paymentByCash: result.paymentByCash,
          paymentByTransfer: result.paymentByTransfer,
          paymentByCredit: result.paymentByCredit,
          paymentByInstallment: result.paymentByInstallment,
          //
          tradeInType: result.tradeInType,
          productBuyingPrice: 0,
          finalBuyingPrice: 0,
          totalCriteriaPrice: 0,
        ));
      } else {
        emit(GetDraftingInvoiceDetailError(state: state));
      }
    } catch (e) {
      _loggerHelper.logError(message: 'GetDraftingInvoiceDetail', obj: e);
    }
  }

  FutureOr<void> _onRemoveDraftingInvoice(RemoveDraftingInvoiceEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      XToast.loading();
      await draftingStorage.deleteDraftingInvoice(draftId: event.id);
      add(GetDraftingInvoiceListEvent());
    } catch (e) {
      _loggerHelper.logError(message: 'RemoveDraftingInvoice', obj: e);
    } finally {
      XToast.closeAllLoading();
    }
  }

  FutureOr<void> _onGetDraftingInvoiceList(GetDraftingInvoiceListEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      emit(GetDraftingInvoiceLoading(state: state));
      final result = await draftingStorage.getDraftingInvoiceList();
      emit(GetDraftingInvoiceSuccess(
        state: state,
        draftingInvoiceList: result,
      ));
    } catch (e) {
      _loggerHelper.logError(message: 'GetDraftingInvoiceList', obj: e);
      emit(GetDraftingInvoiceError(state: state));
    }
  }

  FutureOr<void> _onCreateNewDraftingInvoice(
      CreateNewDraftingInvoiceEvent event,
      Emitter<DraftingInvoiceState> emit) async {
    try {
      XToast.loading();
      final result =
          await draftingStorage.createDraftingInvoice(cartType: event.typeCart);
      if (result != null) {
        emit(DraftingInvoiceCreated(state: state, id: result));
      } else {
        XToast.showWarningMessage(message: 'Chưa thể tạo nháp hãy thử lại');
      }
    } catch (e) {
      _loggerHelper.logError(message: 'CreateNewDraftingInvoice', obj: e);
    } finally {
      XToast.closeAllLoading();
    }
  }
}
