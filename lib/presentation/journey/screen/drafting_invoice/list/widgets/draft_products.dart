part of '../drafts_screen.dart';

class DraftProducts extends StatefulWidget {
  const DraftProducts({
    super.key,
    this.products = const [],
  });

  final List<ProductTable> products;

  @override
  State<DraftProducts> createState() => _DraftProductsState();
}

class _DraftProductsState extends State<DraftProducts> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isExpanded,
        builder: (context, value, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // final item = widget.products[index];
                      // todo: add product info
                      return Container();
                      // return BasicProductInfo(
                      //   productName: item.getName,
                      //   productPrice: item.getSellingPrice,
                      //   productQuantity: item.getQuantity,
                      //   productImei: item.imei?.imeiNo,
                      //   productImage: item.getImageThumbnail,
                      // );
                    },
                    separatorBuilder: (context, index) => BoxSpacer.s8,
                    itemCount: value ? widget.products.length : 1),
              ),
              if (widget.products.length > 1)
                XBaseButton(
                  onPressed: () {
                    _isExpanded.value = !value;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (value) ...[
                        Text(
                          'Ẩn bớt',
                          style: AppFont.t.s(12).information,
                        ),
                      ] else ...[
                        Text(
                          '(+ ${widget.products.length - 1} sản phẩm khác)',
                          style: AppFont.t.s(12).information,
                        ),
                      ],
                      if (value) ...[
                        Icon(
                          Icons.arrow_drop_up,
                          size: 16.sp,
                          color: AppColors.informationColor,
                        )
                      ] else ...[
                        Icon(
                          Icons.arrow_drop_down,
                          size: 16.sp,
                          color: AppColors.informationColor,
                        )
                      ],
                    ],
                  ),
                ),
            ],
          );
        });
  }
}
