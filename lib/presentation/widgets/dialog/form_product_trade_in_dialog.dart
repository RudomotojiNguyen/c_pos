import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/enum/enum.dart';
import '../../../common/extensions/extension.dart';
import '../../../data/datasources/local_db/local_db.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../gen/assets.gen.dart';
import '../../mixins/mixins.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class FormProductTradeInDialog extends StatefulWidget {
  const FormProductTradeInDialog({super.key, required this.onResult});

  final Function(ProductTable product) onResult;

  @override
  State<FormProductTradeInDialog> createState() =>
      _FormProductTradeInDialogState();
}

class _FormProductTradeInDialogState extends State<FormProductTradeInDialog>
    with DialogHelper {
  final TextEditingController _imeiController = TextEditingController();
  Timer? _timer;
  final ValueNotifier<ProductTable?> _productController = ValueNotifier(null);

  String get getImeiStr => _imeiController.text.trim();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _imeiController.dispose();
    _productController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero.copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeaderDialog(title: 'Thông tin sản phẩm'),
          _inputImei(),
          // _productOfCompany(),
          BoxSpacer.s16,
          _productTradeIn(),
          BoxSpacer.s32,
          _bottomSubmit(),
        ],
      ),
    );
  }

  ///
  /// WIDGET
  ///
  Widget _bottomSubmit() {
    return ValueListenableBuilder(
      valueListenable: _productController,
      builder: (context, value, _) {
        if (value != null) {
          return XButton(
            onPressed: () {
              value.imei = ProductImeiModel(imeiNo: getImeiStr);
              widget.onResult(value);
              Navigator.pop(context);
            },
            title: 'Xác nhận',
          );
        }
        return BoxSpacer.blank;
      },
    );
  }

  /// imei sản phẩm
  /// khi nhập vào sẽ kiểm tra xem imei này có thuộc của DDV không
  Widget _inputImei() {
    return XTextField(
      labelText: '',
      hintText: 'Nhập imei sản phẩm',
      controller: _imeiController,
      autoFocus: true,
      // suffixWidget: XBaseButton(
      //   onPressed: () {
      //     showModalCameraScan(
      //       context,
      //       onResult: ({code, codes}) {
      //         if (code.isNotNullOrEmpty) {
      //           _imeiController.text = code ?? '';
      //         }
      //       },
      //     );
      //   },
      //   child: Assets.svg.barcode.svg(
      //     width: 24.sp,
      //     height: 24.sp,
      //   ),
      // ),
    );
  }

  /// thông tin sản phẩm sẽ định giá
  Widget _productTradeIn() {
    return ValueListenableBuilder(
      valueListenable: _productController,
      child: XBaseButton(
        onPressed: () {
          _onSearchProductTradeIn();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
          decoration: BoxDecoration(
            color: AppColors.pinkLightColor,
            borderRadius: BorderRadius.all(AppRadius.xxm),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thêm sản phẩm',
                style: AppFont.t.s().primaryColor,
              ),
              BoxSpacer.s8,
              Icon(
                Icons.add,
                color: AppColors.primaryColor,
                size: 16.sp,
              ),
            ],
          ),
        ),
      ),
      builder: (context, value, child) {
        if (value != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sản phẩm định giá',
                style: AppFont.t.s(),
              ),
              BoxSpacer.s8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ProductItemDetailWidget(
                      productName: value.getName,
                      productImei: '',
                      productImage: value.getImageThumbnail,
                      sellingPrice: value.getSellingPrice,
                      discountPrice: 0,
                      padding: EdgeInsets.all(8.sp),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(AppRadius.l),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 8.sp,
                            offset: const Offset(
                              0,
                              1,
                            ), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  BoxSpacer.s16,
                  XBaseButton(
                    onPressed: () {
                      _onSearchProductTradeIn();
                    },
                    child: Assets.svg.edit.svg(
                      width: 24.sp,
                      height: 24.sp,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        if (child != null) {
          return child;
        }
        return BoxSpacer.blank;
      },
    );
  }

  ///
  /// METHOD
  ///

  _onSearchProductTradeIn({String? searchStr}) {
    showXBottomSheet(
      context,
      enableDrag: true,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      margin: EdgeInsets.zero.copyWith(top: 60.sp),
      body: SearchProductTradeInDialog(
        searchStr: searchStr,
        onResult: (ProductModel product) {
          _productController.value =
              product.convertToTable(itemType: XItemType.main);
        },
      ),
    );
  }
}
