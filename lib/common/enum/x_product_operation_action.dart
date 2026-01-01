import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/gen.dart';
import '../../presentation/theme/themes.dart';
import '../configs/box.dart';

enum XProductOperationAction {
  // detail, // chi tiết sản phẩm
  customerDetail, // chi tiết khách hàng
  remove, // xóa sản phẩm
  note, // ghi chú sản phẩm
  addGift, // thêm quà tặng
  addAttach, // thêm sản phẩm mua kèm
  discountByHand, // chiết khấu tay
  addImei, // thêm imei
  addWarrantyImei, // thêm imei bảo hành
  // addAttachImei, // thêm imei sản phẩm mua kèm
  editRepurchasePrice, // sửa giá thu lại
  updateQuantity, // số lượng
  copyData, // copy thông tin sản phẩm
  update, // cập nhật
  customerInfo, // thông tin khách hàng
  addMore, // lên đơn mới
  voucher, // thêm voucher
  removeVoucher, // xóa voucher
  addProductCombo, // thêm sản phẩm combo
}

extension XProductOperationActionExtension on XProductOperationAction {
  String get getTitle {
    switch (this) {
      // case XProductOperationAction.detail:
      //   return 'Chi tiết';
      case XProductOperationAction.customerDetail:
        return 'Thông tin khách';
      case XProductOperationAction.remove:
        return 'Xóa';
      case XProductOperationAction.note:
        return 'Ghi chú';
      case XProductOperationAction.addGift:
        return 'Thêm quà tặng';
      case XProductOperationAction.addAttach:
        return 'Thêm sản phẩm mua kèm';
      case XProductOperationAction.discountByHand:
        return 'Chiết khấu tay';
      case XProductOperationAction.addImei:
        return 'IMEI';
      case XProductOperationAction.addWarrantyImei:
        return 'IMEI bảo hành';
      // case XProductOperationAction.addAttachImei:
      //   return 'Đính kèm Imei';
      case XProductOperationAction.editRepurchasePrice:
        return 'Chỉnh giá thu lại';
      case XProductOperationAction.copyData:
        return 'Chép thông tin';
      case XProductOperationAction.update:
        return 'Cập nhật';
      case XProductOperationAction.customerInfo:
        return 'Thông tin khách hàng';
      case XProductOperationAction.addMore:
        return 'Mua';
      case XProductOperationAction.voucher:
        return 'Voucher';
      case XProductOperationAction.addProductCombo:
        return 'Thêm sản phẩm con';
      default:
        return '';
    }
  }

  Widget get getIcon {
    switch (this) {
      // case XProductOperationAction.detail:
      case XProductOperationAction.customerDetail:
        return Icon(
          Icons.info_outline,
          color: AppColors.iconColor,
          size: 20.sp,
        );
      case XProductOperationAction.remove:
        return Icon(
          Icons.backspace_outlined,
          color: AppColors.iconColor,
          size: 18.sp,
        );
      case XProductOperationAction.note:
        return Icon(
          Icons.sticky_note_2_outlined,
          color: AppColors.iconColor,
          size: 18.sp,
        );
      case XProductOperationAction.addGift:
        return Icon(
          Icons.card_giftcard,
          color: AppColors.iconColor,
          size: 18.sp,
        );
      case XProductOperationAction.addAttach:
        return Icon(
          Icons.attach_file,
          color: AppColors.iconColor,
          size: 18.sp,
        );
      case XProductOperationAction.discountByHand:
        return Icon(
          Icons.discount_outlined,
          color: AppColors.iconColor,
          size: 18.sp,
        );
      case XProductOperationAction.addImei:
      case XProductOperationAction.addWarrantyImei:
        // case XProductOperationAction.addAttachImei:
        return Icon(
          Icons.sticky_note_2_outlined,
          color: AppColors.iconColor,
          size: 20.sp,
        );
      case XProductOperationAction.editRepurchasePrice:
      case XProductOperationAction.update:
        return Icon(
          Icons.edit_outlined,
          color: AppColors.iconColor,
          size: 20.sp,
        );
      case XProductOperationAction.copyData:
        return Icon(
          Icons.copy_outlined,
          color: AppColors.iconColor,
          size: 20.sp,
        );
      case XProductOperationAction.addMore:
        return Assets.svg.addToCart.svg(
          width: 24.sp,
          height: 24.sp,
        );
      case XProductOperationAction.voucher:
        return Icon(
          Icons.loyalty_outlined,
          color: AppColors.iconColor,
          size: 20.sp,
        );
      case XProductOperationAction.addProductCombo:
        return Icon(
          Icons.add_outlined,
          color: AppColors.iconColor,
          size: 20.sp,
        );
      default:
        return BoxSpacer.blank;
    }
  }
}
