import '../constants/notification_constants.dart';

extension NotificationCategoryExtensions on NotificationCategory {
  dynamic fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    switch (this) {
      case NotificationCategory.promotion:
      case NotificationCategory.coupon:
      default:
        return null;
    }
  }
}
