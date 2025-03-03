import 'package:flutter/material.dart';

import '../../../common/extensions/extension.dart';
import '../../theme/themes.dart';
import 'x_toast.dart';

class ToastWidget extends StatelessWidget {
  final String? description;
  final Color? backgroundColor;
  final XToastEnum type;

  const ToastWidget({
    super.key,
    this.description,
    this.backgroundColor,
    this.type = XToastEnum.neutral,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case XToastEnum.positive:
        return _buildInfoMessageWidget(
          context,
          Icons.check,
          const Color(0xFF00CC99),
        );
      case XToastEnum.negative:
        return _buildInfoMessageWidget(
          context,
          Icons.error_outline,
          AppColors.errorColor,
        );
      case XToastEnum.warning:
        return _buildInfoMessageWidget(
          context,
          Icons.warning,
          Colors.orange,
        );
      default:
        return _buildInfoMessageWidget(
          context,
          Icons.info_outline_rounded,
          const Color(0xFF2F80ED),
        );
    }
  }

  Widget _buildInfoMessageWidget(
    BuildContext context,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: context.toastWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 5.0,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(5.0),
        elevation: 0,
        color: AppColors.white,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 4.0, color: color)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 24.0,
                height: 24.0,
                margin: const EdgeInsets.only(left: 8, top: 2),
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: color,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  description ?? '',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
