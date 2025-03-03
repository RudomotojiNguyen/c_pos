import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/extensions/extension.dart';

class XColumnInfoWidget extends StatelessWidget {
  const XColumnInfoWidget(
      {super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: AppFont.t.s(12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
