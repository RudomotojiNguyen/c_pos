import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/di/injection/injection.dart';
import '../../../common/extensions/extension.dart';
import '../../journey/screen/product/bloc/product_bloc.dart';
import '../../theme/themes.dart';
import '../../utils/utils.dart';
import '../widgets.dart';

class ReasonSelectImeiDialog extends StatefulWidget {
  const ReasonSelectImeiDialog({super.key, required this.callback});

  final Function(String reason) callback;

  @override
  State<ReasonSelectImeiDialog> createState() => _ReasonSelectImeiDialogState();
}

class _ReasonSelectImeiDialogState extends State<ReasonSelectImeiDialog> {
  final ProductBloc _productBloc = getIt.get<ProductBloc>();
  int indexSelected = -1;
  String reasonSelected = '';

  @override
  void initState() {
    super.initState();
    _productBloc.add(GetReasonSelectImeiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const HeaderDialog(title: 'Lý do bạn chọn Imei khác !!!'),
          BoxSpacer.s16,
          Expanded(child: _content()),
          BoxSpacer.s16,
          _bottom(),
        ],
      ),
    );
  }

  ///
  /// WIDGET
  ///

  Widget _bottom() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: XButton(
        padding: EdgeInsets.symmetric(vertical: 12.sp),
        onPressed: () {
          if (indexSelected < 0) {
            XToast.showWarningMessage(
              message: 'Hãy chọn 1 lý do bạn sử dụng Imei khác',
            );
          } else {
            widget.callback(reasonSelected);
            Navigator.pop(context);
          }
        },
        title: 'Xong',
      ),
    );
  }

  Widget _content() {
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: _productBloc,
      builder: (context, state) {
        if (state is OnLoadingGetReasonSelectImei) {
          return XPlaceHolder(
            width: Utils.randomNumber(40, 200).sp,
            height: 12.sp,
          );
        }
        final List<String> reasons =
            (state is GetReasonSelectImeiSuccess ? state.reasons : []);
        if (reasons.isEmpty) {
          return const EmptyDataWidget(
            emptyMessage: 'Không tìm thấy lý do để chọn',
          );
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          itemBuilder: (context, index) {
            String reason = reasons[index];
            bool isSelected = indexSelected == index;
            return XBaseButton(
              onPressed: () {
                if (!isSelected) {
                  setState(() {
                    indexSelected = index;
                    reasonSelected = reason;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16.sp,
                  horizontal: 16.sp,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(AppRadius.xxm),
                  color: isSelected
                      ? AppColors.warningColor.withValues(alpha: .4)
                      : AppColors.white,
                ),
                child: Text(
                  reason,
                  style: AppFont.t.s(),
                ),
              ),
            );
          },
          itemCount: reasons.length,
          separatorBuilder: (context, index) => BoxSpacer.s4,
        );
      },
    );
  }
}
