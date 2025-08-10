part of '../drafting_detail_screen.dart';

class GroupProductChildrenWidget extends StatelessWidget {
  const GroupProductChildrenWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.data,
    required this.callBackAction,
  });

  final String title;
  final Widget icon;
  final List<ProductTable> data;
  final Function(XProductOperationAction action, ProductTable productItem)
      callBackAction;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return BoxSpacer.blank;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoxSpacer.s12,
        Row(
          children: [
            icon,
            BoxSpacer.s8,
            Text(
              title,
              style: AppFont.t.s(),
            ),
          ],
        ),
        BoxSpacer.s8,
        SizedBox(
          height: 130.sp,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 4.sp),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductChildBuyMoreWidget(
                product: data[index],
                callBackAction: (action) => callBackAction(action, data[index]),
              );
            },
            separatorBuilder: (context, index) => BoxSpacer.s16,
            itemCount: data.length,
          ),
        ),
      ],
    );
  }
}

class ProductChildBuyMoreWidget extends StatefulWidget {
  const ProductChildBuyMoreWidget({
    super.key,
    required this.product,
    required this.callBackAction,
  });

  final ProductTable product;
  final Function(XProductOperationAction action) callBackAction;

  @override
  State<ProductChildBuyMoreWidget> createState() =>
      _ProductChildBuyMoreWidgetState();
}

class _ProductChildBuyMoreWidgetState extends State<ProductChildBuyMoreWidget> {
  @override
  Widget build(BuildContext context) {
    Widget operation(Future<void> Function() closeOverlay) => Container(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _childOperation(closeOverlay),
          ),
        );

    double productPrice = widget.product.getSellingPrice;

    return XBaseButton(
      baseButtonType: BaseButtonType.tapOperation,
      secondaryWidgetBuilder: operation,
      child: Container(
        width: 160.sp,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(AppRadius.xxm),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 8.sp,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product.getName,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppFont.t.s(),
            ),
            BoxSpacer.s8,
            Text(
              productPrice.formatCurrency,
              style: AppFont.t.s().primaryColor.w700,
            ),
            if (widget.product.isCheckRepurchasePrice) ...[
              BoxSpacer.s8,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.replay_outlined,
                    color: AppColors.primaryColor,
                    size: 20.sp,
                  ),
                ],
              ),
            ],
            if (widget.product.getImei.isNotNullOrEmpty) ...[
              BoxSpacer.s4,
              XImeiInfo(imei: widget.product.getImei, isCopyImei: true),
            ],
            // if (widget.product.externalImeiNo.isNotNullOrEmpty) ...[
            //   XImeiInfo(imei: widget.product.externalImeiNo!, isCopyImei: true),
            // ],
          ],
        ),
      ),
    );
  }

  List<Widget> _childOperation(Future<void> Function() closeOverlay) {
    List<Widget> data = [];

    final XItemType itemType = widget.product.itemType;

    if (itemType == XItemType.gift) {
      data = [
        // RowFunctionWidget(
        //   title: XProductOperationAction.editRepurchasePrice.getTitle,
        //   icon: XProductOperationAction.editRepurchasePrice.getIcon,
        //   onPressed: () async {
        //     await closeOverlay();
        //     widget.callBackAction(XProductOperationAction.editRepurchasePrice);
        //   },
        // ),
        // RowFunctionWidget(
        //   title: XProductOperationAction.checkRepurchasePrice.getTitle,
        //   icon: XProductOperationAction.checkRepurchasePrice.getIcon,
        //   onPressed: () async {
        //     await closeOverlay();
        //     widget.callBackAction(XProductOperationAction.checkRepurchasePrice);
        //   },
        // ),
        RowFunctionWidget(
          title: XProductOperationAction.remove.getTitle,
          icon: XProductOperationAction.remove.getIcon,
          onPressed: () async {
            await closeOverlay();
            widget.callBackAction(XProductOperationAction.remove);
          },
        ),
      ];
    }
    if (itemType == XItemType.attach) {
      data = [
        RowFunctionWidget(
          title: XProductOperationAction.remove.getTitle,
          icon: XProductOperationAction.remove.getIcon,
          onPressed: () async {
            await closeOverlay();
            widget.callBackAction(XProductOperationAction.remove);
          },
        ),
      ];
    }

    if (widget.product.productType == ProductType.imei) {
      data.add(
        RowFunctionWidget(
          title: XProductOperationAction.addImei.getTitle,
          icon: XProductOperationAction.addImei.getIcon,
          onPressed: () async {
            await closeOverlay();
            widget.callBackAction(XProductOperationAction.addImei);
          },
        ),
      );
    }

    return data;
  }
}
