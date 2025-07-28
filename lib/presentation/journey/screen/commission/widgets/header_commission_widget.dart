import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/configs/box.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../mixins/mixins.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';

class HeaderCommissionWidget extends StatefulWidget {
  const HeaderCommissionWidget({
    super.key,
    required this.commissionsArise,
    required this.actualMoneyReceived,
    required this.totalProductsSold,
    required this.totalProductReturned,
    required this.otherAmountAdded,
    required this.otherAmountDeducted,
    required this.listBonus,
    required this.listMinus,
  });

  final double commissionsArise;
  final double actualMoneyReceived;
  final double totalProductsSold;
  final double totalProductReturned;
  final double otherAmountAdded;
  final double otherAmountDeducted;
  final List<RewardMoreModel> listBonus;
  final List<RewardMoreModel> listMinus;

  @override
  State<HeaderCommissionWidget> createState() => _HeaderCommissionWidgetState();
}

class _HeaderCommissionWidgetState extends State<HeaderCommissionWidget>
    with DialogHelper {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
        child: Column(
          children: [
            Row(
              children: [
                _baseContainer(
                  title: 'SP bán',
                  value: widget.totalProductsSold.formatNumber,
                ),
                BoxSpacer.s16,
                _baseContainer(
                  title: 'SP trả',
                  value: widget.totalProductReturned.formatNumber,
                ),
              ],
            ),
            BoxSpacer.s16,
            Row(
              children: [
                _baseContainer(
                  title: 'Hoa hồng phát sinh',
                  value: widget.commissionsArise.formatCurrency,
                ),
                BoxSpacer.s16,
                _baseContainer(
                  title: 'Tiền thực lãnh',
                  value: widget.actualMoneyReceived.formatCurrency,
                ),
              ],
            ),
            BoxSpacer.s16,
            Row(
              children: [
                _navigateContainer(
                  title: 'Tiền cộng khác',
                  value: widget.otherAmountAdded.formatCurrency,
                  colorBtn: AppColors.successColor,
                  onPressed: () {
                    showXBottomSheet(
                      context,
                      body: CommissionDetailDialog(data: widget.listBonus),
                    );
                  },
                ),
                BoxSpacer.s16,
                _navigateContainer(
                  title: 'Tiền trừ khác',
                  value: widget.otherAmountDeducted.formatCurrency,
                  colorBtn: AppColors.errorColor,
                  onPressed: () {
                    showXBottomSheet(
                      context,
                      body: CommissionDetailDialog(data: widget.listMinus),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _baseContainer({
    required String title,
    required String value,
    Color bgColor = AppColors.white,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(AppRadius.xxm),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8.sp,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppFont.t.s(12),
            ),
            Text(
              value,
              style: AppFont.t.s(16).w800,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigateContainer({
    required String title,
    required String value,
    Color colorBtn = AppColors.white,
    Function()? onPressed,
  }) {
    return Expanded(
      child: Stack(
        children: [
          XBaseButton(
            onPressed: onPressed,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 16.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(AppRadius.xxm),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8.sp,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppFont.t.s(12),
                  ),
                  Text(
                    value,
                    style: AppFont.t.s(16).w800,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: XBaseButton(
              onPressed: onPressed,
              child: Container(
                padding: EdgeInsets.all(4.sp),
                decoration: BoxDecoration(
                    color: colorBtn,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.sp),
                    )),
                child: Icon(
                  Icons.arrow_forward,
                  size: 12.sp,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
