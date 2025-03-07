import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends XStateWidget<ProductDetailScreen> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const XAppBar(
      title: 'Chi tiết sản phẩm',
    );
  }
}
