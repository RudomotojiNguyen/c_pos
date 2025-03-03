enum NotificationCategory {
  promotion(value: kPromotion),
  coupon(value: kCoupon),
  others(value: '');

  const NotificationCategory({required this.value});

  final String value;

  static const kPromotion = 'KM';
  static const kCoupon = 'COUPON';

  static NotificationCategory from({required String value}) {
    switch (value) {
      case NotificationCategory.kPromotion:
        return NotificationCategory.promotion;
      case NotificationCategory.kCoupon:
        return NotificationCategory.coupon;
      default:
        return NotificationCategory.others;
    }
  }
}
