import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/configs/box.dart';
import '../../../common/constants/go_router.dart';
import '../../../common/di/injection/injection.dart';
import '../../../common/enum/enum.dart';
import '../../../common/extensions/extension.dart';
import '../../journey/router.dart';
import '../../journey/screen/drafting_invoice/detail/bloc/drafting_invoice_bloc.dart';
import '../button/x_button.dart';

class OperationCreateDialog extends StatefulWidget {
  const OperationCreateDialog({super.key});

  @override
  State<OperationCreateDialog> createState() => _OperationCreateDialogState();
}

class _OperationCreateDialogState extends State<OperationCreateDialog> {
  final DraftingInvoiceBloc _draftingInvoiceBloc =
      getIt.get<DraftingInvoiceBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<DraftingInvoiceBloc, DraftingInvoiceState>(
      bloc: _draftingInvoiceBloc,
      listener: (context, state) {
        if (state is DraftingInvoiceCreated) {
          Navigator.pop(context);
          MainRouter.instance.goNamed(
            context,
            routeName: RouteName.drafts,
            queryParameters: {'draftId': state.currentDraftId.toString()},
          );
        }
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: context.maxWidthDialog),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            renderItem(
              title: CartType.order.getTitle,
              icon: CartType.order.getIcon(),
              onPressed: () async {
                _draftingInvoiceBloc.add(
                    CreateNewDraftingInvoiceEvent(typeCart: CartType.order));
              },
            ),
            BoxSpacer.s2,
            renderItem(
              title: CartType.retail.getTitle,
              icon: CartType.retail.getIcon(),
              onPressed: () async {
                _draftingInvoiceBloc.add(
                    CreateNewDraftingInvoiceEvent(typeCart: CartType.retail));
              },
            ),
            BoxSpacer.s2,
            renderItem(
              title: CartType.tradeIn.getTitle,
              icon: CartType.tradeIn.getIcon(),
              onPressed: () async {
                _draftingInvoiceBloc.add(
                    CreateNewDraftingInvoiceEvent(typeCart: CartType.tradeIn));
              },
            ),
          ],
        ),
      ),
    );
  }

  ///--- widget ---///
  Widget renderItem({
    Function()? onPressed,
    required String title,
    required Widget icon,
  }) {
    return XButton(
      onPressed: onPressed,
      type: XButtonType.transparent,
      child: Row(
        children: [
          icon,
          BoxSpacer.s16,
          Text(
            title,
            style: AppFont.t.s(14),
          ),
        ],
      ),
    );
  }
}
