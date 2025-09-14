import 'dart:async';

import 'package:c_pos/common/configs/box.dart';
import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/mixins/dialog_mixins.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/enum/enum.dart';
import '../../../../../data/models/models.dart';
import '../../../../theme/themes.dart';
import '../../../../widgets/widgets.dart';
import '../../imei_history/search_list/widgets/list_imei_widget.dart';
import '../../login/bloc/auth_bloc.dart';
import '../../store/bloc/store_bloc.dart';
import '../bloc/stock_bloc.dart';

part '../widget/products_search.dart';
part '../widget/search_box.dart';
part '../widget/product_item.dart';

/// danh sách sản phẩm tồn kho
class SearchStockScreen extends StatefulWidget {
  const SearchStockScreen({super.key});

  @override
  State<SearchStockScreen> createState() => _SearchStockScreenState();
}

class _SearchStockScreenState extends XStateWidget<SearchStockScreen>
    with DialogHelper {
  final StockBloc _searchStockBloc = getIt.get<StockBloc>();

  @override
  void initState() {
    super.initState();
    _searchStockBloc.add(GetProductsEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(title: 'Kiểm kho sản phẩm');
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Stack(
      children: [
        ProductsSearch(searchProductBloc: _searchStockBloc),
        Positioned(
          bottom: 16.sp,
          left: 0,
          right: 0,
          child: SearchBox(searchProductBloc: _searchStockBloc),
        ),
      ],
    );
  }
}
