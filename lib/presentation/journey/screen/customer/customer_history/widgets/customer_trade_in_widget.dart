import 'package:flutter/material.dart';

import 'package:c_pos/data/models/models.dart';

import '../../../../../../common/di/injection/injection.dart';
import '../../../../../../common/enum/enum.dart';
import '../../../trade_in/bloc/trade_in_bloc.dart';
import '../../../trade_in/trade_in_list/widgets/trade_in_list_widget.dart';

// todo: chưa làm

class CustomerTradeInWidget extends StatefulWidget {
  const CustomerTradeInWidget({super.key, required this.customer});

  final CustomerModel customer;

  @override
  State<CustomerTradeInWidget> createState() => _CustomerTradeInWidgetState();
}

class _CustomerTradeInWidgetState extends State<CustomerTradeInWidget> {
  final TradeInBloc _tradeInBloc = getIt.get<TradeInBloc>();

  @override
  void initState() {
    super.initState();
    _tradeInBloc.add(UpdateFilterEvent(
      searchType: SearchType.phoneNumber,
      searchValue: widget.customer.getCustomerPhone,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return TradeInListWidget(tradeInBloc: _tradeInBloc);
  }
}
