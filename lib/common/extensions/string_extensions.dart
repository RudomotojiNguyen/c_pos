import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import '../../presentation/utils/utils.dart';
import '../constants/enum.dart';
import '../constants/notification_constants.dart';
import '../../common/extensions/extension.dart';
import '../enum/enum.dart';

extension StringExtensions on String {
  bool get isUtcFormat {
    return endsWith('Z') || contains('+00:00');
  }

  String checkDifferenceTime({String format = 'yyyy-MM-dd HH:mm:ss'}) {
    DateFormat inputFormat = DateFormat(format);
    DateTime parsedDateTime = inputFormat.parse(this);

    if (!parsedDateTime.isToday()) {
      DateFormat dateFormat = DateFormat('dd/MM/yyyy');
      return dateFormat.format(parsedDateTime);
    } else {
      Duration difference = DateTime.now().difference(parsedDateTime);
      int hoursDifference = difference.inHours;
      int minutesDifference = difference.inMinutes.remainder(60);

      if (hoursDifference > 0) {
        return '$hoursDifference giờ và $minutesDifference phút trước';
      } else {
        return '$minutesDifference phút trước';
      }
    }
  }

  static const _diacritics =
      'ÀÁÂẬẤẦẨẪĂẶẮẰẲẴÃÄÅẶàáâậấầẩẫãäåắằẳẵặÒÓỌỎÕƠỢỚỜỞỠÔỘÕÕÖØòóọỏõơợớờởỡôộõöø'
      'ÈÉÊỆËẾỀỂỄỆếềệểễệèéêëðÇç'
      'ÐÌÍÎÏỈĨỊỉĩịìíîïƯỪỨỬỮỰÙÚÛÜỦŨỤừứửủữũụùúûüÑñŠšŸÿýŽž';
  static const _nonDiacritics =
      'AAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaOOOOOOOOOOOOOOOOOoooooooooooooooo'
      'EEEEEEEEEEeeeeeeeeeeeCc'
      'DIIIIIIIiiiiiiiUUUUUUUUUUUUUuuuuuuuuuuuNnSsYyyZz';

  bool isBlank() {
    return length != 0;
  }

  String get removeUtf8 => splitMapJoin('',
      onNonMatch: (char) => char.isNotEmpty && _diacritics.contains(char)
          ? _nonDiacritics[_diacritics.indexOf(char)]
          : char);

  String formatDateTime() {
    try {
      final dateTime = DateTime.parse(this);
      return DateFormat('hh:mm aa, dd/MM/yyyy', 'vi').format(dateTime);
    } catch (e) {
      return '';
    }
  }

  DiscountType get convertDiscountType {
    return isNullOrEmpty
        ? DiscountType.none
        : (this == 'percent' ? DiscountType.percent : DiscountType.amount);
  }

  String formatDate({String format = 'dd/MM/yyyy', int duration = 0}) {
    try {
      // Chuyển thành DateTime và áp dụng UTC+0
      DateTime dateTime = DateTime.parse(this).toUtc();

      // Chuyển đổi thời gian sang múi giờ UTC+7
      DateTime dateTimeInUtcPlus7 = dateTime.add(Duration(hours: duration));

      // Định dạng thời gian theo dạng dd/MM/yyyy
      return DateFormat(format).format(dateTimeInUtcPlus7);
    } catch (e) {
      return '';
    }
  }

  bool isExpired() {
    try {
      final dateTime = DateTime.parse(this);
      return dateTime.isBefore(DateTime.now());
    } catch (e) {
      return false;
    }
  }

  DateTime? toTypeDateTime({
    required XDateTimeEnum currentFormat,
    required XDateTimeEnum newFormat,
  }) {
    if (currentFormat == newFormat) {
      DateFormat originalFormat =
          DateFormat(XDateTimeEnum.dayMonthYear.getValue);

      return originalFormat.parse(this);
    } else {
      if (Utils.isValidFormatDateTime(this, currentFormat.getValue)) {
        DateFormat originalFormat = DateFormat(currentFormat.getValue);
        DateFormat outputFormat = DateFormat(newFormat.getValue);
        //
        DateTime dateTime = originalFormat.parse(this);
        //
        return outputFormat.parse(dateTime.toString());
      }
    }

    return null;
  }

  DateTime get convertToDateTime {
    DateTime dateTime = DateTime.parse(this);
    if (isUtcFormat) {
      dateTime = dateTime.toUtc().add(const Duration(hours: 7));
    }

    return dateTime;
  }

  TicketType get getTicketType =>
      TicketTypeExtension.mapTicketType[this] ?? TicketType.none;

  String get toStrSearch => removeUtf8.toLowerCase();

  XDiscountType get getDiscountType =>
      XDiscountTypeExtension.mapStr[this] ?? XDiscountType.none;
}

extension StringValidator on String {
  bool isURL() {
    const pattern =
        r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
    return _isValid(pattern);
  }

  bool isEmail() {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return _isValid(pattern);
  }

  bool isValidName() {
    final int length = this.length;
    if (length < 1 || length > 255) {
      return false;
    }
    const pattern = r'^[A-Za-z ]+$';
    return _isValid(pattern);
  }

  bool _isValid(String pattern, {bool caseSensitive = false}) {
    return RegExp(pattern, caseSensitive: caseSensitive).hasMatch(this);
  }

  bool isValidInt() => int.tryParse(this) != null;

  bool isValidDouble() => double.tryParse(this) != null;

  bool isWhiteSpace() => trim().isEmpty;

  bool haveSpace() => contains(' ');

  bool isValidPassword() {
    if (length != trim().length) {
      return false;
    }
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~`)\%\-(_+=;:,.<>/?"[{\]}\|^]).{8,50}$';

    return _isValid(pattern, caseSensitive: true);
  }

  bool isValidDomain() {
    const pattern =
        r'^(((?!\-))(xn\-\-)?[a-z0-9\-_]{0,61}[a-z0-9]{1,1}\.)*(xn\-\-)?([a-z0-9\-]{1,61}|[a-z0-9\-]{1,30})\.[a-z]{2,}$';
    return _isValid(pattern);
  }

  bool isValidTypeImage() {
    final List<String> listTypeImage = [
      'jpg',
      'JPG',
      'jpeg',
      'JPEG',
      'png',
      'PNG',
    ];
    return listTypeImage.contains(this);
  }
}

extension NotificationType on String {
  NotificationCategory? get category {
    return NotificationCategory.values
        .firstWhereOrNull((element) => element.value == this);
  }
}

extension StringCheckerExtensions on String? {
  /// Returns `true` if this nullable char sequence is either `null` or empty.
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  /// Returns `false` if this nullable char sequence is either `null` or empty.
  bool get isNotNullOrEmpty {
    return this != null && this!.isNotEmpty;
  }

  /// Returns a progression that goes over the same range in the opposite
  /// direction with the same step.
  String reversed() {
    var res = '';
    for (int i = this!.length; i >= 0; --i) {
      res = this![i];
    }
    return res;
  }

  /// Returns the value of this number as an [int]
  int toInt() => int.parse(this!);

  /// Returns the value of this number as an [int] or null if can not be parsed.
  int? toIntOrNull() {
    if (this == null) {
      return null;
    }
    return int.tryParse(this!);
  }

  /// Returns the value of this number as an [double]
  double toDouble() => double.parse(this!);

  /// Returns the value of this number as an [double] or null if can not be
  /// parsed.
  double? toDoubleOrNull() {
    if (this == null) {
      return null;
    }
    return double.tryParse(this!);
  }

  /// Returns true if 'this' is "true", otherwise - false
  bool toBoolean() => this?.toLowerCase() == 'true';

  ///  Replaces part of string after the first occurrence of given delimiter
  ///  with the [replacement] string.
  ///  If the string does not contain the delimiter, returns [defaultValue]
  ///  which defaults to the original string.
  String? replaceAfter(String delimiter, String replacement,
      [String? defaultValue]) {
    if (this == null) {
      return null;
    }
    final index = this!.indexOf(delimiter);
    return (index == -1)
        ? defaultValue!.isNullOrEmpty
            ? this
            : defaultValue
        : this!.replaceRange(index + 1, this!.length, replacement);
  }

  /// Replaces part of string before the first occurrence of given delimiter
  /// with the [replacement] string.
  ///  If the string does not contain the delimiter, returns
  ///  [missingDelimiterValue!] which defaults to the original string.
  String? replaceBefore(String delimiter, String replacement,
      [String? defaultValue]) {
    if (this == null) {
      return null;
    }
    final index = this!.indexOf(delimiter);
    return (index == -1)
        ? defaultValue!.isNullOrEmpty
            ? this
            : defaultValue
        : this!.replaceRange(0, index, replacement);
  }

  ///Returns `true` if at least one element matches the given [predicate].
  /// the [predicate] should have only one character
  bool anyChar(bool Function(String element) predicate) =>
      this?.split('').any((s) => predicate(s)) ?? false;

  /// Returns last symbol of string or empty string if `this` is null or empty
  String get last {
    if (isNullOrEmpty) {
      return '';
    }
    return this![this!.length - 1];
  }

  /// Returns `true` if strings are equals without matching case
  bool equalsIgnoreCase(String? other) =>
      (this == null && other == null) ||
      (this != null &&
          other != null &&
          this?.toLowerCase() == other.toLowerCase());

  /// Returns `true` if string contains another without matching case
  bool containsIgnoreCase(String? other) {
    if (other == null) {
      return false;
    }
    return this?.toLowerCase().contains(other.toLowerCase()) ?? false;
  }

  /// Returns `true` if this more than 255 chars
  bool isMoreThan(int limit) {
    return this!.length > limit;
  }
}
