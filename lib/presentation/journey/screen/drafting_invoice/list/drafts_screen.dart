import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:c_pos/data/datasources/local_db/local_db.dart';
import 'package:c_pos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../common/configs/box.dart';
import '../../../../../common/constants/go_router.dart';
import '../../../../../common/di/injection/injection.dart';
import '../../../../../common/enum/enum.dart';
import '../../../../../data/datasources/local_data/local_data.dart';
import '../../../../theme/themes.dart';
import '../../../router.dart';
import 'bloc/drafting_invoices_bloc.dart';

part 'widgets/drafts_widget.dart';
part 'widgets/draft_item.dart';
part 'widgets/draft_type_widget.dart';
part 'widgets/draft_products.dart';

class DraftsScreen extends StatefulWidget {
  const DraftsScreen({super.key});

  @override
  State<DraftsScreen> createState() => _DraftsScreenState();
}

class _DraftsScreenState extends XStateWidget<DraftsScreen> {
  final DraftingInvoicesBloc _draftingInvoicesBloc =
      getIt.get<DraftingInvoicesBloc>();

  @override
  void initState() {
    super.initState();
    _draftingInvoicesBloc.add(GetDraftingInvoiceListEvent());
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(title: 'Đơn nháp');
  }

  @override
  Widget buildContentView(BuildContext context) {
    return const DraftsWidget();
  }

  @override
  Widget buildFloatingActionButton(BuildContext context) {
    return const BtnCreateBill();
  }
}
