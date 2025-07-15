import 'dart:async';

import 'package:c_pos/common/configs/box.dart';
import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/constants/go_router.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/presentation/mixins/dialog_mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/di/injection/injection.dart';
import '../../../../common/enum/enum.dart';
import '../../../theme/themes.dart';
import '../../../widgets/widgets.dart';
import '../../router.dart';
import '../drafting_invoice/detail/bloc/drafting_invoice_bloc.dart';
import 'bloc/search_product_bloc.dart';
import 'widgets/products_search.dart';

part 'widgets/search_box.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends XStateWidget<SearchScreen> with DialogHelper {
  final SearchProductBloc _searchProductBloc = getIt.get<SearchProductBloc>();
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  @override
  void initState() {
    super.initState();
    _searchProductBloc.add(RefreshProductsEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return XAppBar(
      title: 'Tìm kiếm sản phẩm',
      actions: [
        XButton(
          padding: EdgeInsets.all(8.sp),
          type: XButtonType.transparent,
          onPressed: () async {
            showModalCameraScan(
              context,
              onResult: ({code, codes}) {
                if (code.isNotNullOrEmpty) {
                  // widget.searchProductBloc
                  //     .add(OnSearchProductsEvent(code ?? ''));
                  // searchController.text = code ?? '';
                  context.hideKeyboard;
                }
              },
            );
          },
          child: Icon(
            Icons.qr_code,
            size: 20.sp,
            color: AppColors.iconColor,
          ),
        ),
        BoxSpacer.s16,
      ],
    );
  }

  @override
  Widget buildContentView(BuildContext context) {
    return BlocListener<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      listener: (context, state) {
        final int? currentDraftId = state.currentDraftId;
        if (state is UpdateProductsSuccess && currentDraftId != null) {
          if (MainRouter.instance.isRouteInStack(context, RouteName.drafts)) {
            MainRouter.instance.popUtil(
              context,
              routeName: RouteName.drafts,
              queryParameters: {
                'draftId': currentDraftId.toString(),
              },
            );
          } else {
            MainRouter.instance.goNamed(
              context,
              routeName: RouteName.drafts,
              queryParameters: {
                'draftId': currentDraftId.toString(),
              },
            );
          }
        }
      },
      child: Stack(
        children: [
          ProductsSearch(searchProductBloc: _searchProductBloc),
          Positioned(
            bottom: 16.sp,
            left: 0,
            right: 0,
            child: SearchBox(searchProductBloc: _searchProductBloc),
          ),
        ],
      ),
    );
  }
}
