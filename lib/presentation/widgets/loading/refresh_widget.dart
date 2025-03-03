import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../theme/themes.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const WaterDropHeader(waterDropColor: AppColors.primaryColor);
  }
}
