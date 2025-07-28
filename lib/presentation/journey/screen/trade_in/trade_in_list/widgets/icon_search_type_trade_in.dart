import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/enum/enum.dart';
import '../../../../../../common/extensions/extension.dart';
import '../../../../../widgets/widgets.dart';
import '../../bloc/trade_in_bloc.dart';

class IconSearchTypeTradeIn extends StatelessWidget {
  const IconSearchTypeTradeIn({super.key, required this.tradeInBloc});

  final TradeInBloc tradeInBloc;

  @override
  Widget build(BuildContext context) {
    return CustomizePopUpWidget(
      content: _dataSearchType(context),
      child: _contentSearchType(),
    );
  }

  Widget _contentSearchType() {
    return BlocBuilder<TradeInBloc, TradeInState>(
      bloc: tradeInBloc,
      buildWhen: (previous, current) =>
          previous.filterInfo.getSearchType != current.filterInfo.getSearchType,
      builder: (context, state) {
        return Text(
          state.filterInfo.searchTypeShortTitle,
          style: AppFont.t.s(),
        );
      },
    );
  }

  Widget _dataSearchType(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemDataSearchType(context, title: SearchType.phoneNumber.getTitle,
            onPressed: () {
          tradeInBloc
              .add(UpdateFilterEvent(searchType: SearchType.phoneNumber));
          Navigator.pop(context);
        }),
        _itemDataSearchType(context, title: SearchType.imei.getTitle,
            onPressed: () {
          tradeInBloc.add(UpdateFilterEvent(searchType: SearchType.imei));
          Navigator.pop(context);
        }),
      ],
    );
  }

  Widget _itemDataSearchType(
    BuildContext context, {
    required String title,
    required Function() onPressed,
  }) {
    return XBaseButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(vertical: 4.sp),
      child: Text(
        title,
        style: AppFont.t.s(),
      ),
    );
  }
}
