import 'package:flutter/material.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../widgets/widgets.dart';
import '../../category/bloc/category_bloc.dart';
import '../bloc/stock_bloc.dart';
import '../widget/list_stock_widget.dart';
import '../widget/search_stock_widget.dart';

class ManageStockScreen extends StatefulWidget {
  const ManageStockScreen({super.key});

  @override
  State<ManageStockScreen> createState() => _ManageStockScreenState();
}

class _ManageStockScreenState extends XStateWidget<ManageStockScreen> {
  final CategoryBloc _categoryBloc = getIt.get<CategoryBloc>();
  final StockBloc _stockBloc = getIt.get<StockBloc>();

  @override
  void initState() {
    super.initState();
    _categoryBloc.add(GetCategoryEvent());
    _stockBloc.add(GetProductsEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(
      title: 'Kiểm tồn',
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Column(
      children: [
        SearchStockWidget(
          stockBloc: _stockBloc,
          categoryBloc: _categoryBloc,
        ),
        BoxSpacer.s8,
        Expanded(
          child: ListStockWidget(stockBloc: _stockBloc),
        ),
      ],
    );
  }
}
