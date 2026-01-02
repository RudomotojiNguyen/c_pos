import 'package:c_pos/common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const dsnSentry =
      'https://178c08c15a654258607b889c5aee3c39@o440638.ingest.us.sentry.io/4508979448250368';

  //
  static const timeSearchValue = 600;

  static const defaultNullValue = '--';

  static const defaultTimeCountDown = 120; // tính theo giây

  static const defaultImage = 'https://didongviet.vn/NoImage.png';

  static CustomerModel defaultCustomer = CustomerModel(
    id: -1,
    // tài khoản mặc định để là -1 để ẩn những thứ cẩn ẩn
    phoneNo: '0123456789',
    fullName: 'Khách hàng mặc định',
    appellation: XGenderType.male.getValue,
    gender: XGenderType.male,
  );
}

class CacheKeys {
  static const token = 'app_token';
  static const refreshToken = 'refresh_token';
}

class GlobalAppKey {
  static final rootScaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static const updateDialogKey = ValueKey('updateDialogKey');
  static const internetDialogKey = ValueKey('internetDialogKey');
  static const selectBillTypeDialogKey = ValueKey('selectBillTypeDialogKey');
  static const methodDialogKey = ValueKey('methodDialogKey');
  static const addImeiDialogKey = ValueKey('addImeiDialogKey');
  static const productNoteDialogKey = ValueKey('productNoteDialogKey');
  static const imeiAttachDialogKey = ValueKey('imeiAttachDialogKey');
  static const groupProductChildrenDetailDialogKey =
      ValueKey('groupProductChildrenDetailDialogKey');
  static const scanDialogKey = ValueKey('scanDialogKey');
  static const commissionDetailDialogKey =
      ValueKey('commissionDetailDialogKey');
  static const noteDetailDialogKey = ValueKey('noteDetailDialogKey');
  static const customerDetailDialogKey = ValueKey('customerDetailDialogKey');
  static const inputDeliveryDialogKey = ValueKey('inputDeliveryDialogKey');
  static const selectEmployeeDialogKey = ValueKey('selectEmployeeDialogKey');
  static const otpFormDialogKey = ValueKey('otpFormDialogKey');
  static const selectProductDialogKey = ValueKey('selectProductDialogKey');
  static const formProductTradeInDialogKey =
      ValueKey('formProductTradeInDialogKey');
  static const selectVoucherDialogKey = ValueKey('selectVoucherDialogKey');
  static const discountByHandDialogKey = ValueKey('discountByHandDialogKey');
  static const repurchasePriceDialogKey = ValueKey('repurchasePriceDialogKey');
  static const discountDialogKey = ValueKey('discountDialogKey');
  static const stockDialogKey = ValueKey('stockDialogKey');
  static const formCreateRequestExchangeStoreKey =
      ValueKey('formCreateRequestExchangeStoreKey');
}

class DataConstants {
  static List<BaseEnumModel> orderType = [
    BaseEnumModel(
      id: FilterBillAndOrderType.store.getValue,
      name: FilterBillAndOrderType.store.getTitle,
    ),
    BaseEnumModel(
      id: FilterBillAndOrderType.preOrder.getValue,
      name: FilterBillAndOrderType.preOrder.getTitle,
    ),
    BaseEnumModel(
      id: FilterBillAndOrderType.delivery.getValue,
      name: FilterBillAndOrderType.delivery.getTitle,
    ),
    BaseEnumModel(
      id: FilterBillAndOrderType.deliveryByThirdParty.getValue,
      name: FilterBillAndOrderType.deliveryByThirdParty.getTitle,
    ),
    BaseEnumModel(
      id: FilterBillAndOrderType.website.getValue,
      name: FilterBillAndOrderType.website.getTitle,
    ),
    BaseEnumModel(
      id: FilterBillAndOrderType.unSelect.getValue,
      name: FilterBillAndOrderType.unSelect.getTitle,
    ),
  ];

  /// note: dành cho đơn hàng
  static List<BaseEnumModel> orderStatusCr = [];
  static List<BaseEnumModel> orderStatusDp = [];

  static List<BaseEnumModel> orderStatusShop = [
    BaseEnumModel(
      id: StatusEnum.unSelect.getValue,
      name: StatusEnum.unSelect.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.confirmed.getValue,
      name: StatusEnum.confirmed.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.packing.getValue,
      name: StatusEnum.packing.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.ready.getValue,
      name: StatusEnum.ready.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.delivery.getValue,
      name: StatusEnum.delivery.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.unSuccess.getValue,
      name: StatusEnum.unSuccess.getTitle,
    ),
  ];

  static List<BaseEnumModel> orderStatus = [
    BaseEnumModel(
      id: StatusEnum.unSelect.getValue,
      name: StatusEnum.unSelect.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.newTransaction.getValue,
      name: StatusEnum.newTransaction.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.confirming.getValue,
      name: StatusEnum.confirming.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.noCatchPhone.getValue,
      name: StatusEnum.noCatchPhone.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.tracking.getValue,
      name: StatusEnum.tracking.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.keepDeposit.getValue,
      name: StatusEnum.keepDeposit.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.confirmed.getValue,
      name: StatusEnum.confirmed.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.packing.getValue,
      name: StatusEnum.packing.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.ready.getValue,
      name: StatusEnum.ready.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.delivery.getValue,
      name: StatusEnum.delivery.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.success.getValue,
      name: StatusEnum.success.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.refunded.getValue,
      name: StatusEnum.refunded.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.unSuccess.getValue,
      name: StatusEnum.unSuccess.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.systemCancel.getValue,
      name: StatusEnum.systemCancel.getTitle,
    ),
    BaseEnumModel(
      id: StatusEnum.crCancel.getValue,
      name: StatusEnum.crCancel.getTitle,
    ),
  ];
}


// ORDER_TYPE: [
//     { id: null, name: 'Chọn loại' },
//     { id: 1, name: 'Mua tại quầy' },
//     { id: 2, name: 'Đặt trước' },
//     { id: 3, name: 'Tự vận chuyển' },
//     { id: 4, name: 'Hãng vận chuyển (Ahamove, Nhất tín ...)' },
//     { id: 5, name: 'Website' },
//   ],