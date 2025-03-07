import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/di/injection/injection.dart';
import '../../../../theme/themes.dart';
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
    return XAppBar(
      title: 'Quản lý đơn hàng',
      actions: [
        XButton(
          onPressed: () {},
          type: XButtonType.transparent,
          child: Icon(
            Icons.add_circle,
            size: 24.sp,
            color: AppColors.iconColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Column(
      children: [
        SearchOrderWidget(
          orderBloc: _orderBloc,
        ),
        Expanded(
            child: OrderListWidget(
          orderBloc: _orderBloc,
        )),
      ],
    );
  }
}
