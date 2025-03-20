part of 'discount_dialog.dart';

class CouponItemInfo extends StatelessWidget {
  const CouponItemInfo({
    super.key,
    required this.coupon,
    this.isSelected = false,
    required this.onSelect,
  });

  final CouponModel coupon;
  final bool isSelected;
  final Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return CouponCard(
      curvePosition: 100.sp,
      curveRadius: 18.sp,
      borderRadius: 16.sp,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.secondColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      firstChild: firstChild(context),
      secondChild: secondChild(context),
    );
  }

  Widget firstChild(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            coupon.name ?? '',
            style: AppFont.t.s().white,
          ),
          BoxSpacer.s8,
          Text.rich(
            TextSpan(
              style: AppFont.t.s().white.w500,
              text: 'Giảm ',
              children: [
                TextSpan(
                  text: coupon.getValue.formatNumber +
                      coupon.getDiscountType.unit,
                  style: AppFont.t.s().white.w800,
                ),
                if (coupon.getDiscountType == XDiscountType.percent) ...[
                  const TextSpan(text: ' tối đa '),
                  TextSpan(
                    text: coupon.getMaxValue.formatCurrency,
                    style: AppFont.t.s().white.w800,
                  ),
                ],
              ],
            ),
          ),
          BoxSpacer.s8,
          Text.rich(
            TextSpan(
              style: AppFont.t.s().white.w500,
              text: 'Ngày kết thúc: ',
              children: [
                TextSpan(
                  text: coupon.getEndDate,
                  style: AppFont.t.s().white.w800,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget secondChild(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coupon.getCode,
                style: AppFont.t.s(16).white.w800,
              ),
              Text.rich(
                TextSpan(
                  style: AppFont.t.s().white.w500,
                  text: 'Còn lại ',
                  children: [
                    TextSpan(
                      text: coupon.getCanUse.formatNumber,
                      style: AppFont.t.s().white.w800,
                    ),
                  ],
                ),
              ),
            ],
          ),
          XBaseButton(
            onPressed: onSelect,
            child: isSelected
                ? Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.sp, horizontal: 4.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.sp),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          spreadRadius: 5,
                          blurRadius: 5.0,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check,
                      size: 18.sp,
                    ),
                  )
                : Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.sp, horizontal: 16.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.sp),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          spreadRadius: 5,
                          blurRadius: 5.0,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      'Chọn',
                      style: AppFont.t.s().copyWith(
                            fontWeight:
                                isSelected ? FontWeight.w800 : FontWeight.w500,
                            color: isSelected
                                ? AppColors.white
                                : AppColors.neutralColor,
                          ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
