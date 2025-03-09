import 'package:flutter/material.dart';

import '../../../../../../data/models/customer_model.dart';

// todo: chưa làm

class CustomerTradeInWidget extends StatefulWidget {
  const CustomerTradeInWidget({super.key, required this.customer});

  final CustomerModel customer;

  @override
  State<CustomerTradeInWidget> createState() => _CustomerTradeInWidgetState();
}

class _CustomerTradeInWidgetState extends State<CustomerTradeInWidget> {
  // final TradeInBloc _tradeInBloc = getIt.get<TradeInBloc>();

  @override
  void initState() {
    super.initState();
    // _tradeInBloc.add(UpdateFilterEvent(
    //   searchType: SearchType.phoneNumber,
    //   searchValue: widget.customer.getCustomerPhone,
    // ));
  }

  @override
  Widget build(BuildContext context) {
    // return TradeInListWidget(tradeInBloc: _tradeInBloc);
    return Container();
  }
}
