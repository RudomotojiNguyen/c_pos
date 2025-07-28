import 'package:c_pos/common/di/injection/injection.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../bill/list/bloc/bill_bloc.dart';
import '../../../bill/list/widgets/bill_list_widget.dart';

class CustomerBillsWidget extends StatefulWidget {
  const CustomerBillsWidget({super.key, required this.customer});

  final CustomerModel customer;

  @override
  State<CustomerBillsWidget> createState() => _CustomerBillsWidgetState();
}

class _CustomerBillsWidgetState extends State<CustomerBillsWidget> {
  final BillBloc _billBloc = getIt.get<BillBloc>();

  @override
  void initState() {
    super.initState();
    _billBloc.add(FilterBillEvent(
      searchValue: widget.customer.getCustomerPhone,
      searchType: SearchType.billPhoneNumber,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BillListWidget(billBloc: _billBloc);
  }
}
