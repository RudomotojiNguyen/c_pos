import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/di/injection/injection.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/trade_in_bloc.dart';
import 'widgets/search_trade_in_widget.dart';
import 'widgets/trade_in_list_widget.dart';

class TradeInsScreen extends StatefulWidget {
  const TradeInsScreen({super.key});

  @override
  State<TradeInsScreen> createState() => _TradeInsScreenState();
}

class _TradeInsScreenState extends XStateWidget<TradeInsScreen> {
  final TradeInBloc _tradeInBloc = getIt.get<TradeInBloc>();

  @override
  void initState() {
    super.initState();
    _tradeInBloc.add(GetTradeInDataEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(title: 'Danh sách định giá');
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Stack(
      children: [
        _listData(),
        Positioned(
          bottom: 28.sp,
          left: 0,
          right: 0,
          child: SearchTradeInWidget(tradeInBloc: _tradeInBloc),
        ),
      ],
    );
  }

  // Widget _filterWidget() {
  //   return SearchTradeInWidget(tradeInBloc: _tradeInBloc);
  // }

  Widget _listData() {
    return TradeInListWidget(tradeInBloc: _tradeInBloc);
  }
}
