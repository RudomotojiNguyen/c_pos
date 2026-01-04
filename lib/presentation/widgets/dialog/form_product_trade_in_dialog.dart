import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/constants/app_constants.dart';
import '../../../common/di/injection/injection.dart';
import '../../../common/enum/enum.dart';
import '../../../common/extensions/extension.dart';
import '../../../data/datasources/local_db/local_db.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../data/services/services.dart';
import '../../mixins/mixins.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class FormProductTradeInDialog extends StatefulWidget {
  const FormProductTradeInDialog(
      {super.key, required this.onResult, this.productTradeIn});

  final Function(ProductTable product) onResult;
  final ProductTable? productTradeIn;

  @override
  State<FormProductTradeInDialog> createState() =>
      _FormProductTradeInDialogState();
}

class _FormProductTradeInDialogState extends State<FormProductTradeInDialog>
    with DialogHelper {
  final TextEditingController _imeiController = TextEditingController();
  Timer? _timer;
  final ValueNotifier<ProductTable?> _productController = ValueNotifier(null);
  final ValueNotifier<bool> isImeiExist = ValueNotifier(false);
  final ValueNotifier<bool> _isLoadingProduct = ValueNotifier(false);

  String get getImeiStr => _imeiController.text.trim();

  final GlobalKey<FormState> _kForm = GlobalKey<FormState>();

  final TradeInServices _tradeInServices = getIt.get<TradeInServices>();

  Timer? _timerCheckImei;

  @override
  void initState() {
    super.initState();
    if (widget.productTradeIn != null) {
      isImeiExist.value = true;
      _imeiController.text = widget.productTradeIn!.getImei;
      _productController.value = widget.productTradeIn;
    }
  }

  @override
  void dispose() {
    _imeiController.dispose();
    _productController.dispose();
    isImeiExist.dispose();
    _isLoadingProduct.dispose();
    _timer?.cancel();
    _timerCheckImei?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _kForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderDialog(title: 'Thông tin sản phẩm'),
            BoxSpacer.s16,
            _inputImei(),
            BoxSpacer.s16,
            _productTradeIn(),
            BoxSpacer.s32,
            _bottomSubmit(),
          ],
        ),
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
              if (!_kForm.currentState!.validate()) {
                return;
              }
              if (getImeiStr.isNullOrEmpty) {
                XToast.showNegativeMessage(
                    message: 'Vui lòng nhập IEMI sản phẩm');
                return;
              }
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
      hintText: 'Nhập IEMI sản phẩm',
      controller: _imeiController,
      autoFocus: true,
      isRequired: true,
      onChanged: (value) => _onChangeImei(value),
      validator: (imeiResult) {
        if (imeiResult.isNullOrEmpty) {
          return 'Vui lòng nhập IEMI sản phẩm';
        }
        return null;
      },
      suffixWidget: XBaseButton(
        onPressed: () {
          showModalCameraScan(
            context,
            onResult: ({code, codes}) {
              if (code.isNotNullOrEmpty) {
                _onChangeImei(code ?? '');
              }
            },
          );
        },
        child: Icon(Icons.qr_code_scanner_sharp,
            size: 18.sp, color: AppColors.iconColor),
      ),
    );
  }

  /// thông tin sản phẩm sẽ định giá
  Widget _productTradeIn() {
    return ValueListenableBuilder(
        valueListenable: isImeiExist,
        builder: (context, imeiExist, child) {
          return ValueListenableBuilder(
            valueListenable: _isLoadingProduct,
            builder: (context, isLoading, _) {
              if (isLoading) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(AppRadius.xxm),
                  ),
                  child: const Center(
                    child: XLoading(),
                  ),
                );
              }
              return ValueListenableBuilder(
                valueListenable: _productController,
                child: XBaseButton(
                  disable: !imeiExist,
                  onPressed: () {
                    _onSearchProductTradeIn();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.sp, vertical: 16.sp),
                    decoration: BoxDecoration(
                      color: !imeiExist
                          ? AppColors.lightGreyColor
                          : AppColors.pinkLightColor,
                      borderRadius: BorderRadius.all(AppRadius.xxm),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thêm sản phẩm',
                          style: AppFont.t.s().copyWith(
                              color: !imeiExist
                                  ? AppColors.disabledActionColor
                                  : AppColors.primaryColor),
                        ),
                        BoxSpacer.s8,
                        Icon(
                          Icons.add,
                          color: !imeiExist
                              ? AppColors.disabledActionColor
                              : AppColors.primaryColor,
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
                              child: Icon(Icons.edit,
                                  size: 18.sp, color: AppColors.iconColor),
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
            },
          );
        });
  }

  ///
  /// METHOD
  ///

  _onSearchProductTradeIn({String? searchStr}) {
    showXBottomSheet(
      context,
      maxHeight: 0.7.sh,
      key: GlobalAppKey.selectProductDialogKey,
      body: SearchProductTradeInDialog(
        searchStr: searchStr,
        onResult: (ProductModel product) {
          _onSelectProduct(product);
        },
      ),
    );
  }

  _onChangeImei(String imei) {
    isImeiExist.value = true;
    _imeiController.text = imei;
    _onSelectProduct(null);

    if (_timerCheckImei?.isActive ?? false) _timerCheckImei?.cancel();
    _timerCheckImei =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      if (imei.trim().isEmpty) {
        return;
      }
      _isLoadingProduct.value = true;
      _tradeInServices.getProductByImei(imei).then((value) {
        final (isEstimateCost, isSoldByCompany, product) = value;
        _isLoadingProduct.value = false;

        _onSelectProduct(product);
      }).catchError((error) {
        _isLoadingProduct.value = false;
      });
    });
  }

  _onSelectProduct(ProductModel? product) {
    _productController.value =
        product?.convertToTable(itemType: XItemType.main);
  }
}
