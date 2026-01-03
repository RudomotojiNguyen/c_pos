part of '../drafting_detail_screen.dart';

class GroupProductChildrenWidget extends StatelessWidget with DialogHelper {
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
        XBaseButton(
          onPressed: () {
            showXBottomSheet(context,
                key: GlobalAppKey.groupProductChildrenDetailDialogKey,
                maxHeight: 0.4.sh,
                body: GroupProductChildrenDetailDialog(
                  data: data,
                  callBackAction: (action, product) {
                    Navigator.pop(context);
                    callBackAction(action, product);
                  },
                ));
          },
          padding: EdgeInsets.symmetric(vertical: 8.sp),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    icon,
                    BoxSpacer.s8,
                    Text(
                      title,
                      style: AppFont.t.s(),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  _countProduct(),
                  BoxSpacer.s8,
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _countProduct() {
    return CircleAvatar(
      radius: 8.sp,
      backgroundColor: AppColors.primaryColor,
      child: Text(
        data.length.toString(),
        style: AppFont.t.s(10).w700.white,
      ),
    );
  }
}

class GroupProductChildrenDetailDialog extends StatelessWidget {
  const GroupProductChildrenDetailDialog({
    super.key,
    required this.data,
    required this.callBackAction,
  });
  final List<ProductTable> data;
  final Function(XProductOperationAction action, ProductTable productItem)
      callBackAction;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 4.sp),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final product = data[index];
        return ProductItemDetailWidget(
          productName: product.getName,
          productImei: product.getImei,
          productImage: product.getImageThumbnail,
          sellingPrice: product.getSellingPrice,
          barCode: product.getBarCode,
          discountPrice: product.discountValue ?? product.getDiscountPrice,
          quantity: product.getQuantity,
          baseButtonType: BaseButtonType.tapOperation,
          decorationChildIsOverlay: BoxDecoration(
            borderRadius: BorderRadius.all(AppRadius.l),
            color: AppColors.white,
          ),
          productOperationActions: const [
            XProductOperationAction.copyData,
            XProductOperationAction.remove,
          ],
          paddingChildIsOverlay:
              EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
          onPressed: ({action}) {
            if (action != null) {
              callBackAction(action, product);
            }
          },
        );
      },
      separatorBuilder: (context, index) => const XDivider(),
      itemCount: data.length,
    );
  }
}
