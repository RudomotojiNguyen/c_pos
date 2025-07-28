part of 'trade_in_loading.dart';

class ListCriteriaLoading extends StatelessWidget {
  const ListCriteriaLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return XContainerLoading(
      childContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoxSpacer.s16,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XPlaceHolder(
                    width: Utils.randomNumber(80, 180).sp,
                    height: 12.sp,
                  ),
                  BoxSpacer.s8,
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return XPlaceHolder(
                        width: Utils.randomNumber(80, 180).sp,
                        height: 12.sp,
                      );
                    },
                    separatorBuilder: (context, index) => BoxSpacer.s4,
                    itemCount: Utils.randomNumber(1, 3).toInt(),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => XDivider(
              padding: EdgeInsets.symmetric(vertical: 8.sp),
            ),
            itemCount: 2,
          )
        ],
      ),
    );
  }
}
