import 'package:flutter/material.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../../common/extensions/extension.dart';
import '../button/x_button.dart';

class OperationCreateDialog extends StatefulWidget {
  const OperationCreateDialog({super.key});

  // final CustomerTable? customer;

  @override
  State<OperationCreateDialog> createState() => _OperationCreateDialogState();
}

class _OperationCreateDialogState extends State<OperationCreateDialog> {
  // final CartStorage _cartStorage = getIt.get<CartStorage>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        renderItem(
          title: CartType.order.getTitle,
          icon: CartType.order.getIcon(),
          onPressed: () async {
            // final res =
            //     await _cartStorage.createNewCart(typeCart: CartType.order);
            // if (res != null) {
            //   Navigator.pop(context);
            //   MainRouter.instance.goNamed(
            //     context,
            //     routeName: CoreRouteName.draftBillDetail,
            //     queryParameters: {'currentDraftId': res.toString()},
            //   );
            // }
          },
        ),
        BoxSpacer.s2,
        renderItem(
          title: CartType.retail.getTitle,
          icon: CartType.retail.getIcon(),
          onPressed: () async {
            // final res =
            //     await _cartStorage.createNewCart(typeCart: CartType.retail);
            // if (res != null) {
            //   Navigator.pop(context);
            //   MainRouter.instance.goNamed(
            //     context,
            //     routeName: CoreRouteName.draftBillDetail,
            //     queryParameters: {'currentDraftId': res.toString()},
            //   );
            // }
          },
        ),
        BoxSpacer.s2,
        renderItem(
          title: CartType.tradeIn.getTitle,
          icon: CartType.tradeIn.getIcon(),
          onPressed: () async {
            // final res =
            //     await _cartStorage.createNewCart(typeCart: CartType.tradeIn);
            // if (res != null) {
            // Navigator.pop(context);
            // MainRouter.instance.goNamed(
            //   context,
            //   routeName: CoreRouteName.draftBillDetail,
            //   queryParameters: {'currentDraftId': res.toString()},
            // );
            // }
          },
        ),
      ],
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
