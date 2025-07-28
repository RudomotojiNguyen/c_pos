import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../../../common/configs/box.dart';
import 'package:c_pos/data/models/models.dart';
import '../widgets.dart';

class WarrantyInfoDialog extends StatelessWidget {
  const WarrantyInfoDialog({super.key, required this.warrantyInfo});

  final WarrantyInfoModel warrantyInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderDialog(title: 'Thông tin bảo hành'),
        BoxSpacer.s8,
        if (warrantyInfo.warrantyMonthNo != null) ...[
          XColumnInfoWidget(
            title: 'Thời hạn bảo hành',
            value: '${warrantyInfo.warrantyMonthNo} tháng',
          ),
        ],
        if (warrantyInfo.warrantyDescription.isNotNullOrEmpty) ...[
          XColumnInfoWidget(
            title: 'Mô tả bảo hành',
            value: warrantyInfo.warrantyDescription ?? '',
          ),
        ],
        if (warrantyInfo.warrantyAddress.isNotNullOrEmpty) ...[
          XColumnInfoWidget(
            title: 'Địa chỉ bảo hành',
            value: warrantyInfo.warrantyAddress ?? '',
          ),
        ],
        if (warrantyInfo.warrantyPhone.isNotNullOrEmpty) ...[
          XColumnInfoWidget(
            title: 'Số điện thoại bảo hành',
            value: warrantyInfo.warrantyPhone ?? '',
          ),
        ],
      ],
    );
  }
}
