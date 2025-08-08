import 'package:flutter/material.dart';

import '../../../common/configs/box.dart';
import '../loading/product_item_loading.dart';

class ProductsLoading extends StatelessWidget {
  const ProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const ProductItemLoading(),
      separatorBuilder: (context, index) => BoxSpacer.s16,
      itemCount: 10,
    );
  }
}
