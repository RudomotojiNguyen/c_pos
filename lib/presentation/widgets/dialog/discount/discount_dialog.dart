import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/configs/box.dart';
import '../../../../common/enum/enum.dart';
import '../../../../data/datasources/local_db/local_db.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../journey/screen/coupon/bloc/coupon_bloc.dart';
import '../../../theme/themes.dart';
import '../../widgets.dart';

part 'coupon_item_info.dart';
part 'coupon_item_loading.dart';
part 'discount_by_amount.dart';
part 'discount_by_code.dart';

enum TypeDiscountInTotalBill { code, amount }

class DiscountDialog extends StatefulWidget {
  const DiscountDialog({
    super.key,
    this.couponCode,
    this.discountAmount,
    this.maxAmountDiscount,
    required this.callBack,
    required this.products,
    this.customerId,
  });

  final String? couponCode;
  final double? discountAmount;
  final double? maxAmountDiscount;
  final int? customerId;
  final List<ProductTable> products;
  final Function(
    String? couponCode,
    double? discountAmount,
  ) callBack;

  @override
  State<DiscountDialog> createState() => _DiscountDialogState();
}

class _DiscountDialogState extends State<DiscountDialog> {
  // final ValueNotifier<TypeDiscountInTotalBill> _typeDiscountInTotalBill =
  //     ValueNotifier(TypeDiscountInTotalBill.code);

  // TypeDiscountInTotalBill get getTypeDiscountInTotalBill =>
  //     _typeDiscountInTotalBill.value;

  @override
  void initState() {
    // if (widget.couponCode.isNullOrEmpty && widget.discountAmount != null) {
    //   _typeDiscountInTotalBill.value = TypeDiscountInTotalBill.amount;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DiscountByAmount(
          products: widget.products,
          customerId: widget.customerId,
          discountAmount: widget.discountAmount,
          callBack: widget.callBack,
          maxAmountDiscount: widget.maxAmountDiscount,
        ),
      ],
    );
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    // _segment(),
    // BoxSpacer.s16,
    // _couponCode(),
    //     _amount(),
    //   ],
    // );
  }

  ///
  /// WIDGET
  ///
  // Widget _segment() {
  //   return Center(
  //     child: SizedBox(
  //       width: 200.sp,
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: XBaseButton(
  //               onPressed: () {
  //                 _onChangeTab(TypeDiscountInTotalBill.code);
  //               },
  //               child: ValueListenableBuilder(
  //                 valueListenable: _typeDiscountInTotalBill,
  //                 builder: (context, value, child) {
  //                   bool isSelected = value == TypeDiscountInTotalBill.code;
  //                   return Container(
  //                     padding: EdgeInsets.symmetric(vertical: 4.sp),
  //                     decoration: BoxDecoration(
  //                         color: isSelected
  //                             ? AppColors.primaryColor
  //                             : AppColors.neutral3Color,
  //                         borderRadius: BorderRadius.only(
  //                           topLeft: Radius.circular(16.sp),
  //                           bottomLeft: Radius.circular(16.sp),
  //                         )),
  //                     child: Text(
  //                       'Mã coupon',
  //                       textAlign: TextAlign.center,
  //                       style: AppFont.t.s().white.copyWith(
  //                             fontWeight: isSelected
  //                                 ? FontWeight.w900
  //                                 : FontWeight.normal,
  //                           ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: XBaseButton(
  //               onPressed: () {
  //                 _onChangeTab(TypeDiscountInTotalBill.amount);
  //               },
  //               child: ValueListenableBuilder(
  //                 valueListenable: _typeDiscountInTotalBill,
  //                 builder: (context, value, child) {
  //                   bool isSelected = value == TypeDiscountInTotalBill.amount;
  //                   return Container(
  //                     padding: EdgeInsets.symmetric(vertical: 4.sp),
  //                     decoration: BoxDecoration(
  //                         color: isSelected
  //                             ? AppColors.primaryColor
  //                             : AppColors.neutral3Color,
  //                         borderRadius: BorderRadius.only(
  //                           topRight: Radius.circular(16.sp),
  //                           bottomRight: Radius.circular(16.sp),
  //                         )),
  //                     child: Text(
  //                       'Giá tiền',
  //                       textAlign: TextAlign.center,
  //                       style: AppFont.t.s().white.copyWith(
  //                             fontWeight: isSelected
  //                                 ? FontWeight.w900
  //                                 : FontWeight.normal,
  //                           ),
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // _amount() {
  //   return ValueListenableBuilder(
  //       valueListenable: _typeDiscountInTotalBill,
  //       builder: (context, value, child) {
  //         if (value != TypeDiscountInTotalBill.amount) {
  //           return BoxSpacer.blank;
  //         }
  //         return DiscountByAmount(
  //           products: widget.products,
  //           customerId: widget.customerId,
  //           discountAmount: widget.discountAmount,
  //           callBack: widget.callBack,
  //         );
  //       });
  // }

  // _couponCode() {
  //   return ValueListenableBuilder(
  //       valueListenable: _typeDiscountInTotalBill,
  //       builder: (context, value, child) {
  //         if (value != TypeDiscountInTotalBill.code) {
  //           return BoxSpacer.blank;
  //         }
  //         return DiscountByCode(
  //           couponCode: widget.couponCode,
  //           products: widget.products,
  //           customerId: widget.customerId,
  //           discountAmount: widget.discountAmount,
  //           callBack: widget.callBack,
  //         );
  //       });
  // }

  ///
  /// METHOD
  ///
  // _onChangeTab(TypeDiscountInTotalBill value) {
  //   if (_typeDiscountInTotalBill.value != value) {
  //     _typeDiscountInTotalBill.value = value;
  //   }
  // }
}
