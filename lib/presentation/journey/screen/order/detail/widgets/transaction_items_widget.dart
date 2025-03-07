// import 'package:dposapp/common/config/box.dart';
// import 'package:dposapp/common/constant/constant.dart';
// import 'package:dposapp/common/extensions/context_extensions.dart';
// import 'package:dposapp/common/extensions/number_extensions.dart';
// import 'package:dposapp/data/models/order_item.dart';
// import 'package:dposapp/presentation/theme/colors.dart';
// import 'package:dposapp/presentation/widgets/loading/product_item_loading.dart';
// import 'package:dposapp/presentation/widgets/x_basic_container.dart';
// import 'package:dposapp/presentation/widgets/x_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TransactionItemsWidget extends StatelessWidget {
//   const TransactionItemsWidget({
//     super.key,
//     this.orderItems = const [],
//     this.isLoading = false,
//   });

//   final List<OrderItemModel> orderItems;
//   final bool isLoading;

//   @override
//   Widget build(BuildContext context) {
//     return XBasicContainer(
//       title: 'Sản phẩm',
//       icon: Icon(
//         Icons.shopping_cart,
//         size: 24.sp,
//         color: AppColors.iconColor,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           if (isLoading) ...[
//             BoxSpacer.s16,
//             const ProductItemLoading(),
//           ],
//           if (orderItems.isNotEmpty && !isLoading) ...[
//             BoxSpacer.s16,
//             ListView.separated(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 final OrderItemModel item = orderItems[index];
//                 return ProductItem(
//                   image: item.getImage,
//                   name: item.getName,
//                   imei: item.getImeiNo,
//                   sellingPrice: item.getSellingPrice,
//                   discountPrice: item.getDiscountPrice,
//                   quantity: item.getQuantity,
//                 );
//               },
//               separatorBuilder: (context, index) => BoxSpacer.s12,
//               itemCount: orderItems.length,
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

// class ProductItem extends StatelessWidget {
//   const ProductItem({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.sellingPrice,
//     required this.discountPrice,
//     required this.imei,
//     required this.quantity,
//   });

//   final String image;
//   final String name;
//   final double sellingPrice;
//   final double discountPrice;
//   final String imei;
//   final int quantity;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: context.appTheme.colorScheme.primaryContainer,
//         borderRadius: BorderRadius.circular(16.sp),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           XImage(
//             imagePath: image,
//             size: Size(60.sp, 60.sp),
//             errorWidget: (ctx, _, object) => XImage(
//               imagePath: CoreConstant.noImage,
//               size: Size(60.sp, 60.sp),
//             ),
//           ),
//           BoxSpacer.s16,
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   name,
//                   style: context.appTheme.textTheme.labelSmall,
//                 ),
//                 BoxSpacer.s4,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     if (sellingPrice > 0) ...[
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             sellingPrice.formatCurrency,
//                             style:
//                                 context.appTheme.textTheme.labelSmall!.copyWith(
//                               color: AppColors.primaryColor,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           if (discountPrice > 0) ...[
//                             BoxSpacer.s8,
//                             Text(
//                               'CK: ${discountPrice.formatCurrency}',
//                               style: context.appTheme.textTheme.labelSmall,
//                             ),
//                           ],
//                         ],
//                       ),
//                     ],
//                     if (quantity > 0) ...[
//                       BoxSpacer.s8,
//                       Text(
//                         '(x${quantity.formatNumber})',
//                         style: context.appTheme.textTheme.labelSmall,
//                       ),
//                     ],
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
