import 'dart:io';
import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../../common/enum/enum.dart';
import '../../data/datasources/local_db/local_db.dart';
import '../theme/themes.dart';
import '../widgets/widgets.dart';

class Utils {
  /// Checks if the given object is null or empty.
  ///
  /// This method returns true if:
  /// - The object is null
  /// - The object is a String, List, or Map and is empty
  ///
  /// @param obj The object to check.
  /// @return true if the object is null or empty, false otherwise.
  static bool checkDataIsNullOrEmpty(dynamic obj) {
    return obj == null ||
        ((obj is String || obj is List || obj is Map) && obj.isEmpty);
  }

  static Uuid uuid = const Uuid();

  static String genUUID() {
    return uuid.v4();
  }

  /// Removes Vietnamese diacritical marks from the input string.
  ///
  /// This method takes a [String] input and removes all Vietnamese-specific
  /// characters, replacing them with their non-accented equivalents.
  ///
  /// Example:
  /// ```dart
  /// String input = "Xin chào thế giới";
  /// String result = Utils.removeVietnameseCharacters(input);
  /// print(result); // Output: "Xin chao the gioi"
  /// ```
  ///
  /// @param input The string to process.
  /// @return A new string with Vietnamese characters replaced.
  static String removeVietnameseCharacters(String input) {
    // Biểu thức chính quy để tìm ký tự tiếng Việt
    RegExp regex = RegExp(
        r'[àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ]');
    return input.replaceAll(regex, ''); // Loại bỏ tất cả các ký tự tiếng Việt
  }

  /// Gets the path to the application's document directory.
  ///
  /// This method retrieves the path to the directory where the application can store files
  /// that are private to the application. On most platforms, this directory is not accessible
  /// to the user or other applications.
  ///
  /// @return A [Future] that completes with a [String] representing the absolute path
  /// to the application's document directory.
  static Future<String> getAppDocumentDirectory() async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// Opens a map application with the specified latitude and longitude.
  ///
  /// This method attempts to open a map application (Google Maps) with the given coordinates.
  /// If successful, it will launch the map application. If it fails, it will throw an exception.
  ///
  /// @param latitude The latitude coordinate.
  /// @param longitude The longitude coordinate.
  /// @throws Exception if the map cannot be opened.
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    Uri uri = Uri.parse(googleUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not open the map.');
    }
  }

  /// Launches a URL in the default browser or appropriate app.
  ///
  /// This method attempts to open the given URL. If the URL is null or empty,
  /// the method returns without doing anything. If the URL cannot be launched,
  /// it throws an exception.
  ///
  /// @param url The URL to launch.
  /// @throws Exception if the URL cannot be launched.
  static Future<void> launchUrlLink(String? url) async {
    if (checkDataIsNullOrEmpty(url)) {
      return;
    }
    final Uri uri = Uri.parse(url!);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  static Future<void> launchPhone(String? phone) async {
    if (checkDataIsNullOrEmpty(phone)) {
      return;
    }
    final Uri uri = Uri(scheme: 'tel', path: phone!);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  /// Converts a dynamic value to a double.
  ///
  /// This method attempts to convert the given data to a double. It handles
  /// null values, existing doubles, and other types that can be converted to a string.
  ///
  /// @param data The value to convert to a double.
  /// @return The converted double value, or 0 if the input is null or cannot be converted.
  static double toDouble(dynamic data) {
    if (data == null) {
      return 0;
    }
    if (data is double) {
      return data;
    }
    if (data is int) {
      return data.toDouble();
    }
    try {
      return double.parse(data.toString());
    } catch (e) {
      return 0;
    }
  }

  static bool toBoolean(dynamic data) {
    if (data == null) {
      return false;
    }
    if (data is bool) {
      return data;
    }
    return data == 1;
  }

  static Future<List<DateTime?>?> showCalendarDatePicker(
    BuildContext context, {
    List<DateTime?> value = const [],
    CalendarDatePicker2Type calendarType = CalendarDatePicker2Type.single,
  }) async {
    return await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: calendarType,
        monthBuilder: (
            {decoration,
            isCurrentMonth,
            isDisabled,
            isSelected,
            required month,
            textStyle}) {
          return MonthItemWidget(
            month: month,
            decoration: decoration,
            isCurrentMonth: isCurrentMonth,
            isDisabled: isDisabled,
            isSelected: isSelected,
            textStyle: textStyle,
          );
        },
        yearBuilder: (
            {decoration,
            isCurrentYear,
            isDisabled,
            isSelected,
            textStyle,
            required year}) {
          return YearItemWidget(
            year: year,
            isCurrentYear: isCurrentYear,
            decoration: decoration,
            isDisabled: isDisabled,
            isSelected: isSelected,
            textStyle: textStyle,
          );
        },
      ),
      dialogSize: Size(325.sp, 400.sp),
      value: value,
      borderRadius: BorderRadius.circular(15.sp),
    );
  }

  static Future<TimeOfDay?> showTime(
    BuildContext context, {
    TimeOfDay? initialTime,
  }) async {
    return await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              backgroundColor: AppColors.white,
              // Background color
              hourMinuteTextColor: AppColors.primaryColor,
              // Text color for hours and minutes
              dayPeriodTextColor: AppColors.primaryColor,
              // Text color for AM/PM
              dayPeriodBorderSide:
                  const BorderSide(color: AppColors.primaryColor),
              // Border color for AM/PM
              dialHandColor: AppColors.secondColor,
              // Color of the hour hand
              dialTextColor: AppColors.neutralColor,
              // Text color on the clock dial
              dialBackgroundColor: AppColors.disabledColor,
              // dayPeriodColor: AppColors.successColor,
              // hourMinuteColor: AppColors.successColor,
              entryModeIconColor: AppColors.neutralColor,
              helpTextStyle: const TextStyle(
                color: AppColors
                    .neutralColor, // Set the text color for "Enter time"
              ),
              cancelButtonStyle: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      AppColors.primaryLightColor),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(AppColors.primaryColor)),
              confirmButtonStyle: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.primaryColor),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(AppColors.white)),
              hourMinuteTextStyle: TextStyle(
                  fontSize: 24.sp), // Text style for hours and minutes
            ),
            textTheme: const TextTheme(
              bodySmall: TextStyle(color: AppColors.neutralColor),
            ),
            colorScheme: ColorScheme(
              surface: AppColors.primaryLightColor,
              primary: AppColors.pinkLightColor,
              secondary: Colors.brown.shade300,
              // background: AppColors.secondColor,
              // onBackground: AppColors.white,
              onSurface: AppColors.white,
              onError: AppColors.white,
              onPrimary: AppColors.white,
              onSecondary: Colors.black,
              brightness: Brightness.dark,
              error: Colors.red,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.primaryColor,
              selectionColor: AppColors.white,
              selectionHandleColor: AppColors.white,
            ),
            // cupertinoOverrideTheme: CupertinoThemeData(
            //   primaryColor: AppColors.white,
            // ),
          ),
          child: child!,
        );
      },
    );
  }

  /// Generates a random double number between [minNumber] and [maxNumber] (inclusive).
  ///
  /// This method creates a random number within the specified range.
  /// The result is always a double, even if the random number is an integer.
  ///
  /// @param minNumber The minimum value of the range (inclusive).
  /// @param maxNumber The maximum value of the range (inclusive).
  /// @return A random double number between minNumber and maxNumber.
  static double randomNumber(int minNumber, int maxNumber) {
    if (maxNumber < minNumber) {
      throw ArgumentError(
          'maxNumber must be greater than or equal to minNumber');
    }
    final random = Random();
    return minNumber + random.nextDouble() * (maxNumber - minNumber + 1);
  }

  /// kiểm tra định dạng ngày
  static bool isValidFormatDateTime(String input, String format) {
    try {
      final dateFormat = DateFormat(format);
      dateFormat.parseStrict(input);
      return true; // Hợp lệ
    } catch (e) {
      return false; // Không hợp lệ
    }
  }

  static void copyToClipboard(BuildContext context, {required String text}) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đã sao chép!')),
    );
  }

  static int countQuantityProductApplyMoreBuyMoreDiscount(
      List<ProductTable> products, List<VoucherTable> vouchers) {
    int data = 0;
    for (var e in vouchers) {
      if (e.cumulativeStringValues.isNotEmpty) {
        data =
            countQuantityProductApplyMoreBuyMoreDiscountForVoucher(products, e);
        break;
      }
    }

    return data;
  }

  /// đếm số lượng sản phẩm có cùng voucher càng mua càng giảm
  static int countQuantityProductApplyMoreBuyMoreDiscountForVoucher(
      List<ProductTable> products, VoucherTable? voucher) {
    return products.fold(
      0,
      (previousValue, element) {
        // tìm sản phẩm có dùng voucher
        final applicableVoucher = element.getVouchers.any(
          (element) =>
              element.cumulativeStringValues.isNotEmpty &&
              element.voucherId == voucher?.voucherId,
        );

        if (applicableVoucher == true) {
          return previousValue + element.getQuantity;
        }

        return previousValue;
      },
    );
  }

  /// tính tiền được giảm bằng voucherGiảm $: giảm chính = số tiền, voucher ko X quantity
  /// vd: 2 SP KCL 100K, voucher 20K => discountAmount = 20k
  /// giá sau giảm: (100*2)- 20Giảm %: giảm % trên 1 SP, voucher ko X quantity
  /// vd: 2 SP KCL 100K, voucher 10% => discountAmount = 100*0.1 = 10k
  /// giá sau giảm: (100*2) - 10
  /// notes: hiện tại thông tin cumulativeValues trong bill đang trả về rỗng nên nếu thắc mắc tăng số lượng tính sai thì hỏi lại BE
  static double discountAmountByVoucher({
    required usedVoucherQuantity, // số lượng voucher (đang xét) được áp dụng trong bill
    required VoucherTable voucher,
    required double sellingPrice,
    required int quantity,
  }) {
    // Set % giảm giá theo số lượng voucherId được sử dụng
    double finalDiscount = 0;

    if (voucher.cumulativeStringValues.isNotEmpty) {
      for (var item in voucher.cumulativeValues) {
        // Voucher càng mua càng giảm thì discountAmount có X số lượng
        if (item.getQuantityFrom <= usedVoucherQuantity &&
            usedVoucherQuantity <= item.quantityTo) {
          if (voucher.type == XDiscountType.percent) {
            // voucher CMCG: percent đó apply cho từng SP
            // vd: KCL iphone 15 giá 100k (mua SL: 2) (voucherCMCG: 3%) -> mỗi cái đc giảm 3% (=3k) -> mua 2 cái giảm 6k
            finalDiscount = ((sellingPrice * item.getValue) / 100) * quantity;
          }
          if (voucher.type == XDiscountType.amount) {
            // voucher CMCG chưa có áp dụng cho giảm theo amount -> nên công thức chỗ này chưa biết update ntn
            finalDiscount = item.getValue * usedVoucherQuantity;
          }
        }
      }
    }
    if (voucher.cumulativeStringValues.isEmpty) {
      if (voucher.type == XDiscountType.percent) {
        //voucher % được quy thành tiền
        finalDiscount = (sellingPrice * voucher.getValue) / 100;
      } else {
        finalDiscount = voucher.getValue;
      }
    }

    if (voucher.getMaxValue > 0 && finalDiscount > voucher.getMaxValue) {
      finalDiscount = voucher.getMaxValue;
    }

    return finalDiscount;
  }
}
