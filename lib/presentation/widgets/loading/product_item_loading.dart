import 'package:flutter/material.dart';

import '../../../common/configs/box.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

class ProductItemLoading extends StatelessWidget {
  const ProductItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(AppRadius.l),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const XPlaceHolder(
            height: 60,
            width: 60,
          ),
          BoxSpacer.s16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const XPlaceHolder(
                  width: 200,
                  height: 12,
                ),
                BoxSpacer.s8,
                const XPlaceHolder(
                  width: 60,
                  height: 12,
                ),
                BoxSpacer.s8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const XPlaceHolder(
                      width: 100,
                      height: 12,
                    ),
                    BoxSpacer.s8,
                    const XPlaceHolder(
                      width: 36,
                      height: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
