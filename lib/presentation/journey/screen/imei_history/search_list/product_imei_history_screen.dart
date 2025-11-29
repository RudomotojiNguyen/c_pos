import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      title: 'Lịch sử IMEI',
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return Stack(
      children: [
        ListImeiWidget(productBloc: productBloc),
        Positioned(
          bottom: 16.sp,
          left: 0,
          right: 0,
          child: SearchImeiWidget(productBloc: productBloc),
        ),
      ],
    );
  }
}
