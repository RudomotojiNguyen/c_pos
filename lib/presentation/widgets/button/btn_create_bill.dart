import 'package:c_pos/gen/gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../mixins/mixins.dart';
import '../dialog/operation_create_dialog.dart';
import 'base_button.dart';

class BtnCreateBill extends StatelessWidget with DialogHelper {
  const BtnCreateBill({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return XBaseButton(
      onPressed: () {
        showXBottomSheet(
          context,
          body: const OperationCreateDialog(),
        ).then(
          (value) {
            // getIt.get<DraftBloc>().add(GetAllDraftBillEvent());
          },
        );
      },
      child: Assets.svg.addToCart.svg(width: 42.sp),
    );
  }
}
