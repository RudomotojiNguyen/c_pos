import 'package:flutter/material.dart';

import '../../presentation/theme/themes.dart';

enum SupportTicketStatus {
  newTicket, // Mới
  recordedInformation, // Đã xác nhận
  processing, // Đang xử lý
  completed, // Hoàn thành
  reject, // Huỷ
  all, // Tất cả
  none;
}

extension SupportTicketStatusExtension on SupportTicketStatus {
  static Map<int, SupportTicketStatus> mapSupportTicketStatus = {
    0: SupportTicketStatus.newTicket,
    1: SupportTicketStatus.recordedInformation,
    2: SupportTicketStatus.processing,
    3: SupportTicketStatus.completed,
    4: SupportTicketStatus.reject,
    5: SupportTicketStatus.all,
  };

  int? get getValue {
    switch (this) {
      case SupportTicketStatus.newTicket:
        return 0; // Mới
      case SupportTicketStatus.recordedInformation:
        return 1; // Đã xác nhận
      case SupportTicketStatus.processing:
        return 2; // Đang xử lý
      case SupportTicketStatus.completed:
        return 3; // Hoàn thành
      case SupportTicketStatus.reject:
        return 4; // Huỷ
      default:
        return null; // Tất cả
    }
  }

  String get getTitle {
    switch (this) {
      case SupportTicketStatus.newTicket:
        return 'Mới';
      case SupportTicketStatus.recordedInformation:
        return 'Đã xác nhận';
      case SupportTicketStatus.processing:
        return 'Đang xử lý';
      case SupportTicketStatus.completed:
        return 'Hoàn thành';
      case SupportTicketStatus.reject:
        return 'Huỷ';
      default:
        return '';
    }
  }

  Color get getColor {
    switch (this) {
      case SupportTicketStatus.newTicket:
        return AppColors.neutralColor;
      case SupportTicketStatus.recordedInformation:
        return AppColors.warningColor;
      case SupportTicketStatus.processing:
        return AppColors.informationColor;
      case SupportTicketStatus.completed:
        return AppColors.successColor;
      case SupportTicketStatus.reject:
        return AppColors.errorColor;
      default:
        return AppColors.neutralColor;
    }
  }
}
