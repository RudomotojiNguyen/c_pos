part of './list_imei_widget.dart';

class ImeiHistoryItemWidget extends StatelessWidget {
  const ImeiHistoryItemWidget({
    super.key,
    required this.imei,
    required this.status,
    this.colorStatus,
    required this.productImage,
    required this.productName,
    required this.sellingPrice,
    this.onPressed,
    this.provider,
  });

  final String imei;
  final String status;
  final Color? colorStatus;

  final String productImage;
  final String productName;
  final double sellingPrice;
  final String? provider;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.sp),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _topInfo(context),
            XDivider(padding: EdgeInsets.symmetric(vertical: 8.sp)),
            _productInfo(),
          ],
        ),
      ),
    );
  }

  Widget _topInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            imei,
            style: AppFont.t.s(12).w700,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
            decoration: BoxDecoration(
                color: colorStatus?.withAlpha(30) ?? AppColors.lightGreyColor,
                borderRadius: BorderRadius.circular(4.sp)),
            child: Text(
              status,
              style: AppFont.t.s(11).w700.copyWith(
                    color: colorStatus ?? AppColors.informationColor,
                  ),
            ),
          )
        ],
      ),
    );
  }

  Widget _productInfo() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: ProductItemDetailWidget(
          productName: productName,
          productImei: '',
          productImage: productImage,
          sellingPrice: sellingPrice,
          discountPrice: 0,
          quantity: 0,
          provider: provider,
        ));
  }
}

class LoadingTransaction extends StatelessWidget {
  const LoadingTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
      itemBuilder: (context, index) {
        return const ImeiHistoryItemLoading();
      },
      separatorBuilder: (context, index) => BoxSpacer.s16,
    );
  }
}
