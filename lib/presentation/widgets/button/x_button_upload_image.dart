import 'package:c_pos/presentation/mixins/dialog_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../gen/assets.gen.dart';
import '../../theme/themes.dart';
import 'base_button.dart';

class XButtonUploadImage extends StatelessWidget with DialogHelper {
  const XButtonUploadImage({super.key, required this.callback});

  final Function(XFile?) callback;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: () => _onSelectImage(context),
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 12.sp),
      decoration: BoxDecoration(
        color: AppColors.diamondWhite,
        borderRadius: BorderRadius.all(AppRadius.xxl),
      ),
      child: Assets.svg.upload.svg(
        width: 32.sp,
        height: 32.sp,
      ),
    );
  }

  _onSelectImage(BuildContext context) {
    showModalSelectImage(context, callback: callback);
  }
}
