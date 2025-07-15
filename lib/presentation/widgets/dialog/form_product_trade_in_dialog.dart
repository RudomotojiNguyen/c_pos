import 'dart:async';

import 'package:flutter/material.dart';

import '../../../common/configs/box.dart';
import '../../../data/datasources/local_db/local_db.dart';
import '../../../data/models/product_imei_model.dart';
import '../../mixins/mixins.dart';
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
  // final TradeInBloc _tradeInBloc = getIt.get<TradeInBloc>();
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
          // _inputImei(),
          // _productOfCompany(),
          BoxSpacer.s16,
          // _productTradeIn(),
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
  // Widget _inputImei() {
  //   return XTextField(
  //     labelText: '',
  //     hintText: 'Nhập imei sản phẩm',
  //     controller: _imeiController,
  //     onChanged: _onChangeText,
  //     autoFocus: true,
  //     suffixWidget: XBaseButton(
  //       onPressed: () {
  //         showModalCameraScan(
  //           context,
  //           onResult: ({code, codes}) {
  //             if (code.isNotNullOrEmpty) {
  //               _imeiController.text = code ?? '';
  //             }
  //           },
  //         );
  //       },
  //       child: Assets.svg.barcode.svg(
  //         width: 24.sp,
  //         height: 24.sp,
  //       ),
  //     ),
  //   );
  // }

  /// hiển thị thông tin sản phẩm nếu tồn tại
  /// có thể lấy tên sp để chuyền vào chỗ tìm sp định giá hoặc chuyển tới trang lịch sử imei
  /// sp này sẽ khác với sp chọn để định giá
  // Widget _productOfCompany() {
  //   return BlocBuilder<TradeInBloc, TradeInState>(
  //     bloc: _tradeInBloc,
  //     buildWhen: (previous, current) =>
  //         current is IsLoading ||
  //         current is GetProductByImeiSuccess ||
  //         current is GetProductByImeiError,
  //     builder: (context, state) {
  //       if (state is IsLoading) {
  //         return const ProductItemLoading();
  //       }
  //       if (state is GetProductByImeiSuccess) {
  //         final ProductModel? product = state.product;
  //         if (product == null) {
  //           return BoxSpacer.blank;
  //         }
  //         return Container(
  //           margin: EdgeInsets.only(top: 16.sp),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 product.getName,
  //                 style: AppFont.t.s(),
  //               ),
  //               if (state.isSoldByCompany) ...[
  //                 BoxSpacer.s8,
  //                 Row(
  //                   children: [
  //                     Container(
  //                       padding: EdgeInsets.symmetric(
  //                         horizontal: 8.sp,
  //                         vertical: 4.sp,
  //                       ),
  //                       decoration: BoxDecoration(
  //                         color: AppColors.warningColor,
  //                         borderRadius: BorderRadius.all(AppRadius.xxm),
  //                       ),
  //                       child: Text(
  //                         'Hàng công ty',
  //                         style: AppFont.t.s().white,
  //                       ),
  //                     ),
  //                     BoxSpacer.s8,
  //                     XBaseButton(
  //                       onPressed: () {
  //                         MainRouter.instance.pushNamed(
  //                           context,
  //                           routeName: RouteName.imeiDetailHistory,
  //                           queryParameters: {'imei': getImeiStr},
  //                         );
  //                       },
  //                       child: Container(
  //                         padding: EdgeInsets.symmetric(
  //                           horizontal: 8.sp,
  //                           vertical: 4.sp,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: AppColors.informationColor,
  //                           borderRadius: BorderRadius.all(AppRadius.xxm),
  //                         ),
  //                         child: Row(
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             Text(
  //                               'Lịch sử',
  //                               style: AppFont.t.s().white,
  //                             ),
  //                             BoxSpacer.s8,
  //                             Icon(
  //                               Icons.search,
  //                               color: AppColors.white,
  //                               size: 12.sp,
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ],
  //           ),
  //         );
  //       }
  //       return BoxSpacer.blank;
  //     },
  //   );
  // }

  /// thông tin sản phẩm sẽ định giá
  // Widget _productTradeIn() {
  //   return ValueListenableBuilder(
  //     valueListenable: _productController,
  //     child: BlocBuilder<TradeInBloc, TradeInState>(
  //       bloc: _tradeInBloc,
  //       buildWhen: (previous, current) =>
  //           current is IsLoading ||
  //           current is GetProductByImeiSuccess ||
  //           current is GetProductByImeiError,
  //       builder: (context, state) {
  //         if (state is GetProductByImeiSuccess) {
  //           return XBaseButton(
  //             onPressed: () {
  //               _onSearchProductTradeIn(searchStr: state.product?.getName);
  //             },
  //             child: Container(
  //               padding: EdgeInsets.symmetric(
  //                 horizontal: 16.sp,
  //                 vertical: 16.sp,
  //               ),
  //               decoration: BoxDecoration(
  //                 color: AppColors.pinkLightColor,
  //                 borderRadius: BorderRadius.all(AppRadius.xxm),
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     'Tìm với tên tương tự',
  //                     style: context.appTheme.textTheme.bodySmall!.copyWith(
  //                       fontSize: 12.sp,
  //                       color: AppColors.primaryColor,
  //                     ),
  //                   ),
  //                   BoxSpacer.s8,
  //                   Icon(
  //                     Icons.search,
  //                     color: AppColors.primaryColor,
  //                     size: 16.sp,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         }
  //         return XBaseButton(
  //           onPressed: () {
  //             _onSearchProductTradeIn();
  //           },
  //           child: Container(
  //             padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
  //             decoration: BoxDecoration(
  //               color: AppColors.pinkLightColor,
  //               borderRadius: BorderRadius.all(AppRadius.xxm),
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   'Thêm sản phẩm',
  //                   style: context.appTheme.textTheme.bodySmall!.copyWith(
  //                     fontSize: 12.sp,
  //                     color: AppColors.primaryColor,
  //                   ),
  //                 ),
  //                 BoxSpacer.s8,
  //                 Icon(
  //                   Icons.search,
  //                   color: AppColors.primaryColor,
  //                   size: 16.sp,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //     builder: (context, value, child) {
  //       if (value != null) {
  //         return Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Sản phẩm định giá',
  //               style: context.appTheme.textTheme.bodyMedium!.copyWith(
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             BoxSpacer.s8,
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Expanded(
  //                   child: ProductItemDetailWidget(
  //                     productName: value.getName,
  //                     productImei: '',
  //                     productImage: value.getImageThumbnail,
  //                     sellingPrice: value.getSellingPrice,
  //                     discountPrice: 0,
  //                     padding: EdgeInsets.all(8.sp),
  //                     decoration: BoxDecoration(
  //                       color: AppColors.white,
  //                       borderRadius: BorderRadius.all(AppRadius.l),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: AppColors.shadowColor,
  //                           blurRadius: 8.sp,
  //                           offset: const Offset(
  //                             0,
  //                             1,
  //                           ), // changes position of shadow
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 BoxSpacer.s16,
  //                 XBaseButton(
  //                   onPressed: () {
  //                     _onSearchProductTradeIn();
  //                   },
  //                   child: core_assets.Assets.svg.gradient.pencil.svg(
  //                     width: 24.sp,
  //                     height: 24.sp,
  //                     package: AssetPackage.dpos,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         );
  //       }
  //       return child!;
  //     },
  //   );
  // }

  ///
  /// METHOD
  ///
  // _onChangeText(String? value) {
  //   if (_timer?.isActive ?? false) _timer?.cancel();
  //   _timer = Timer(const Duration(milliseconds: Constant.timeSearchValue), () {
  //     _tradeInBloc.add(SearchProductByImeiEvent((value ?? '').trim()));
  //   });
  // }

  // _onSearchProductTradeIn({String? searchStr}) {
  //   showXBottomSheet(
  //     context,
  //     enableDrag: true,
  //     padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
  //     margin: EdgeInsets.zero.copyWith(top: 60.sp),
  //     body: SearchProductTradeInDialog(
  //       searchStr: searchStr,
  //       onResult: (ProductModel product) {
  //         _productController.value = product.convertToTable();
  //       },
  //     ),
  //   );
  // }
}
