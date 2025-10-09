part of '../product_reward_screen.dart';

class ProductRewardItem extends StatelessWidget {
  const ProductRewardItem({super.key, required this.rewardProductCheck});

  final RewardProductCheckModel rewardProductCheck;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      child: Column(
        children: [
          _renderTitleReward(context),
          const XDivider(),
          _renderRewardDetail(context),
        ],
      ),
    );
  }

  Widget _renderTitleReward(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rewardProductCheck.getRewardName,
          style: AppFont.t.s().w600,
        ),
        BoxSpacer.s8,
        Text(
          rewardProductCheck.getConfigInfo,
          style: AppFont.t.s().neutral2,
        ),
      ],
    );
  }

  Widget _renderRewardDetail(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          children: [
            Icon(
              Icons.arrow_circle_right,
              size: 12.sp,
              color: AppColors.primaryColor,
            ),
            BoxSpacer.s8,
            Text(
              rewardProductCheck.getCategories[index].getCategoryName,
              style: AppFont.t.s().neutral2,
            ),
          ],
        );
      },
      padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => BoxSpacer.s4,
      itemCount: rewardProductCheck.getCategories.length,
    );
  }
}
