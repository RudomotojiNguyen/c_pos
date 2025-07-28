import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/configs/box.dart';
import '../../../utils/utils.dart';
import '../../widgets.dart';
import '../image_verify_loading.dart';

part 'customer_trade_in_loading.dart';
part 'file_verify_loading.dart';
part 'list_criteria_loading.dart';
part 'product_loading.dart';
part 'store_create_loading.dart';

class TradeInLoading extends StatelessWidget {
  const TradeInLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          BoxSpacer.s16,
          const StoreCreateLoading(),
          BoxSpacer.s16,
          const CustomerTradeInLoading(),
          BoxSpacer.s16,
          const ProductLoading(),
          BoxSpacer.s16,
          const FileVerifyLoading(),
          BoxSpacer.s16,
          const ListCriteriaLoading(),
        ],
      ),
    );
  }
}
