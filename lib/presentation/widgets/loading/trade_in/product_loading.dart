part of 'trade_in_loading.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return XContainerLoading(
      childContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxSpacer.s8,
          Row(
            children: [
              XPlaceHolder(
                width: 80.sp,
                height: 80.sp,
              ),
              BoxSpacer.s8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XPlaceHolder(width: 160.sp, height: 12.sp),
                  BoxSpacer.s8,
                  XPlaceHolder(width: 100.sp, height: 12.sp),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
