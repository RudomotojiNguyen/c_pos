import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/di/injection/injection.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../bill/list/bloc/bill_bloc.dart';

class CustomerWarrantiesWidget extends StatefulWidget {
  const CustomerWarrantiesWidget({super.key, required this.customer});

  final CustomerModel customer;

  @override
  State<CustomerWarrantiesWidget> createState() =>
      _CustomerWarrantiesWidgetState();
}

class _CustomerWarrantiesWidgetState extends State<CustomerWarrantiesWidget> {
  final BillBloc _billBloc = getIt.get<BillBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillBloc, BillState>(
      bloc: _billBloc,
      builder: (context, state) {
        return Container();
      },
    );
  }
}
