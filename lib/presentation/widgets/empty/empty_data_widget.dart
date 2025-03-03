import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import '../../../gen/gen.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({super.key, this.emptyMessage});

  final String? emptyMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            Assets.lottie.emptyData,
            width: 100.sp,
          ),
          if (emptyMessage.isNotNullOrEmpty) ...[
            BoxSpacer.s16,
            Text(
              emptyMessage!,
              style: AppFont.t.s(12),
            ),
          ],
        ],
      ),
    );
  }
}
