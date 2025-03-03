import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/extensions/extension.dart';
import '../../../gen/gen.dart';

class BottomLoadWidget extends StatelessWidget {
  const BottomLoadWidget(
      {super.key,
      this.mode,
      this.canLoadingStr,
      this.noMoreStr,
      this.failedStr});

  final LoadStatus? mode;
  final String? canLoadingStr;
  final String? noMoreStr;
  final String? failedStr;

  @override
  Widget build(BuildContext context) {
    return CustomFooter(builder: (context, mode) {
      if (mode == LoadStatus.loading) {
        return SizedBox(
          height: 80.sp,
          child: Lottie.asset(
            Assets.lottie.driver,
            width: 150.sp,
          ),
        );
      }
      Widget body = const SizedBox.shrink();
      if (mode == LoadStatus.canLoading && canLoadingStr.isNotNullOrEmpty) {
        body = Text(
          canLoadingStr!,
          style: AppFont.t.s(12),
        );
      }
      if (mode == LoadStatus.noMore && noMoreStr.isNotNullOrEmpty) {
        body = Text(
          noMoreStr!,
          style: AppFont.t.s(12),
        );
      }
      if (mode == LoadStatus.failed && failedStr.isNotNullOrEmpty) {
        body = Text(
          failedStr!,
          style: AppFont.t.s(12),
        );
      }
      return SizedBox(
        height: 40.sp,
        child: Center(child: body),
      );
    });
  }
}
