part of '../drafts_screen.dart';

class DraftTypeWidget extends StatelessWidget {
  const DraftTypeWidget({super.key, required this.cartType});

  final CartType cartType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        cartType.getIcon(width: 18.sp, height: 18.sp),
        BoxSpacer.s8,
        Text(
          cartType.getScreenTitle,
          style: AppFont.t.s(),
        ),
      ],
    );
  }
}
