import 'package:flutter/material.dart';

import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../order/bloc/order_bloc.dart';
import '../../../order/list/widgets/order_list_widget.dart';

class CustomerOrdersWidget extends StatefulWidget {
  const CustomerOrdersWidget({super.key, required this.customer});

  final CustomerModel customer;

  @override
  State<CustomerOrdersWidget> createState() => _CustomerOrdersWidgetState();
}

class _CustomerOrdersWidgetState extends State<CustomerOrdersWidget>
    with AutomaticKeepAliveClientMixin {
  final OrderBloc _orderBloc = getIt.get<OrderBloc>();

  @override
  void initState() {
    super.initState();
    _orderBloc.add(FilterOrderEvent(
      searchValue: widget.customer.getCustomerPhone,
      searchType: SearchType.phoneNumber,
    ));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return OrderListWidget(orderBloc: _orderBloc);
  }

  @override
  bool get wantKeepAlive => true;
}
