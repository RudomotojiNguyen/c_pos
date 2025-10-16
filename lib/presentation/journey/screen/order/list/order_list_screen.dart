import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/di/injection/injection.dart';
import '../../../../widgets/widgets.dart';
import '../bloc/order_bloc.dart';
import 'widgets/order_list_widget.dart';
import 'widgets/search_order_widget.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends XStateWidget<OrderListScreen> {
  final OrderBloc _orderBloc = getIt.get<OrderBloc>();

  @override
  void initState() {
    super.initState();
    _orderBloc.add(GetOrderEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(title: 'Quản lý đơn hàng');
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Stack(
      children: [
        OrderListWidget(orderBloc: _orderBloc),
        Positioned(
          bottom: 16.sp,
          left: 0,
          right: 0,
          child: SearchOrderWidget(
            orderBloc: _orderBloc,
          ),
        ),
      ],
    );
  }
}
