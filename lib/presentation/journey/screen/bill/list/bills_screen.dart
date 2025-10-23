import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/di/injection/injection.dart';
import '../../../../widgets/widgets.dart';
import 'bloc/bill_bloc.dart';
import 'widgets/bill_list_widget.dart';
import 'widgets/search_bill_widget.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({super.key});

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends XStateWidget<BillsScreen> {
  final BillBloc _billBloc = getIt.get<BillBloc>();

  @override
  void initState() {
    super.initState();
    _billBloc.add(GetBillListEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(title: 'Danh sách hóa đơn');
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Stack(
      children: [
        BillListWidget(billBloc: _billBloc),
        Positioned(
          bottom: 16.sp,
          left: 0,
          right: 0,
          child: SearchBillWidget(billBloc: _billBloc),
        ),
      ],
    );
  }
}
