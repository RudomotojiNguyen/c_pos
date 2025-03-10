import 'package:flutter/material.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../widgets/widgets.dart';
import '../../product/bloc/product_bloc.dart';
import 'widgets/list_imei_widget.dart';
import 'widgets/search_imei_widget.dart';

class ProductImeiHistoryScreen extends StatefulWidget {
  const ProductImeiHistoryScreen({super.key});

  @override
  State<ProductImeiHistoryScreen> createState() =>
      _ProductImeiHistoryScreenState();
}

class _ProductImeiHistoryScreenState
    extends XStateWidget<ProductImeiHistoryScreen> {
  final ProductBloc productBloc = getIt.get<ProductBloc>();

  @override
  void initState() {
    super.initState();
    productBloc.add(GetImeiHistoryEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(
      title: 'Lịch sử Imei',
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Column(
      children: [
        SearchImeiWidget(productBloc: productBloc),
        BoxSpacer.s8,
        Expanded(child: ListImeiWidget(productBloc: productBloc)),
      ],
    );
  }
}
