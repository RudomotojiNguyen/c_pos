import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import 'transaction_item_loading.dart';

class TransactionsLoading extends StatelessWidget {
  const TransactionsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
      itemBuilder: (context, index) {
        return const TransactionItemLoading();
      },
      separatorBuilder: (context, index) => BoxSpacer.s16,
    );
  }
}
