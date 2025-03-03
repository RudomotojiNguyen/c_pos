import 'dart:async';
import 'dart:math';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../common/configs/box.dart';
import '../../common/enum/enum.dart';
import '../../common/extensions/extension.dart';
import '../theme/themes.dart';
import '../utils/utils.dart';
import 'widgets.dart';

enum DecorationStyle { normal, transparent, rounded, search }

enum TextInputStyle {
  normal,
  selectSingleDate,
  selectMultiDate,
  selectTime,
  button,
}

class XTextField<T> extends StatefulWidget {
  final TextEditingController? controller;
  final ValueNotifier<DateTime?>? dateController;
  final ValueNotifier<TimeOfDay?>? timeController;
  final String? errorText;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final String? initializationText;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final bool autoFocus;
  final bool isEditMode;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final double radius;
  final InputDecoration? inputDecoration;
  final bool obsureText;
  final TextAlign textAlign;
  final TextStyle? style;
  final Color? backgroundColor;
  final DecorationStyle? decorationStyle;
  final ValueChanged<String>? onSubmitted;
  final String? Function(String?)? validator;

  // final Function(String)? onSubmitted;
  final bool isCenterLabel;
  final bool isRequired;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextInputStyle textInputStyle;

  // using for overlay
  final Widget Function(BuildContext, int, dynamic)? itemSearchBuilder;
  final Future<List<T>> Function(String)? futureRequest;
  final Function(T)? onSelectData;
  final List<T>? initItems;
  final Duration? searchDuration;

  final Function(List<DateTime?>? dates)? onResultDateSelect;
  final Function(TimeOfDay? time)? onResultTimeSelect;
  final List<DateTime?>? dates;
  final TimeOfDay? time;

  final String? value;
  final Function()? onPress;

  const XTextField({
    super.key,
    this.isEditMode = true,
    this.controller,
    this.dateController,
    this.timeController,
    this.errorText,
    this.onChanged,
    this.hintText = '',
    this.inputFormatters,
    this.labelText,
    this.initializationText,
    this.prefixWidget,
    this.suffixWidget,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.textInputType,
    this.autoFocus = true,
    this.textInputAction,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.radius = 100.0,
    this.inputDecoration,
    this.obsureText = false,
    this.textAlign = TextAlign.start,
    this.style,
    this.backgroundColor = Colors.white,
    this.decorationStyle = DecorationStyle.normal,
    this.onSubmitted,
    this.isCenterLabel = false,
    this.validator,
    this.isRequired = false,
    this.hintStyle,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    this.initialValue,
    this.textInputStyle = TextInputStyle.normal,
    this.itemSearchBuilder,
    this.futureRequest,
    this.onSelectData,
    this.initItems,
    this.searchDuration,
    this.onResultDateSelect,
    this.dates,
    this.onResultTimeSelect,
    this.time,
    this.value,
    this.onPress,
  });

  @override
  XTextFieldState createState() => XTextFieldState();
}

class XTextFieldState<T> extends State<XTextField<T>> {
  TextStyle? get getHintStyle =>
      widget.hintStyle ??
      AppFont.t.s(12).w400.neutral.copyWith(color: AppColors.neutral3Color);

  late ValueNotifier<bool> isClearData;

  late FocusNode _focusNode;

  late OverlayEntry _overlayEntry;
  Timer? _timer;

  final LayerLink _layerLink = LayerLink();
  final ValueNotifier<List<T>?> items = ValueNotifier(null);

  final ValueNotifier<List<DateTime?>> datesController = ValueNotifier([]);
  final ValueNotifier<DateTime?> dateController = ValueNotifier(null);
  final ValueNotifier<TimeOfDay?> timeController = ValueNotifier(null);
  final ValueNotifier<String?> valueButtonController = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    isClearData = ValueNotifier(false);

    items.value = widget.initItems;
    if (widget.dates != null) {
      datesController.value = widget.dates ?? [];
      dateController.value =
          widget.dates?.isNotEmpty ?? false ? widget.dates?.first : null;
    }
    timeController.value = widget.time;

    if (widget.futureRequest != null) {
      _focusNode.addListener(() {
        if (_focusNode.hasFocus) {
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context).insert(_overlayEntry);
        } else {
          _overlayEntry.remove();
        }
      });
    }
    valueButtonController.value = widget.value;
  }

  @override
  void didUpdateWidget(covariant XTextField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the dates have changed
    if (oldWidget.dates != widget.dates) {
      datesController.value = widget.dates ?? [];
      dateController.value =
          widget.dates?.isNotEmpty ?? false ? widget.dates?.first : null;
    }

    // Check if the time has changed
    if (oldWidget.time != widget.time) {
      timeController.value = widget.time;
    }

    if (oldWidget.initItems != widget.initItems) {
      items.value = widget.initItems;
    }
    if (oldWidget.value != widget.value) {
      valueButtonController.value = widget.value;
    }
  }

  @override
  void dispose() {
    datesController.dispose();
    dateController.dispose();
    timeController.dispose();
    isClearData.dispose();
    items.dispose();
    _timer?.cancel();
    super.dispose();
  }

  EdgeInsetsGeometry? get getContentPadding =>
      widget.contentPadding ??
      EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp);

  Widget? get suffixIcon => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.suffixWidget != null) ...[
            BoxSpacer.s4,
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.sp,
                horizontal: 8.sp,
              ),
              child: widget.suffixWidget,
            )
          ],
        ],
      );

  Widget? get prefixIcon => widget.prefixWidget != null
      ? Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.sp,
            horizontal: 8.sp,
          ),
          child: widget.prefixWidget,
        )
      : null;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText?.isNotEmpty ?? false) ...[
            Row(
              mainAxisAlignment: widget.isCenterLabel
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Text(
                  widget.labelText ?? '',
                  style: AppFont.t.s(12).w500,
                ),
                if (widget.isRequired) ...[
                  Text(
                    ' *',
                    style: AppFont.t.s(12).w500.primaryColor,
                  ),
                ],
              ],
            ),
            BoxSpacer.s8,
          ],
          renderTextInput(),
        ],
      ),
    );
  }

  ///--- widget ---///

  Widget renderTextInput() {
    switch (widget.textInputStyle) {
      case TextInputStyle.normal:
        return _normalTextInput();
      case TextInputStyle.selectTime:
        return _formTimeInput();
      case TextInputStyle.selectSingleDate:
        return _formSingleDateInput();
      case TextInputStyle.selectMultiDate:
        return _formMultipleDateInput();
      case TextInputStyle.button:
        return _buttonWidget();
      default:
        return BoxSpacer.blank;
    }
  }

  Widget _buttonWidget() {
    return XBaseButton(
      onPressed: widget.onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(
            width: 1.sp,
            color: AppColors.dividerColor.withOpacity(.5),
          ),
          color: AppColors.white,
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
        child: ValueListenableBuilder(
          valueListenable: valueButtonController,
          builder: (context, value, child) {
            if (value.isNullOrEmpty) {
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.hintText ?? '',
                      style: getHintStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (widget.suffixWidget != null) ...[widget.suffixWidget!]
                ],
              );
            }
            return Row(
              children: [
                Expanded(
                  child: Text(
                    value!,
                    style: widget.style ?? AppFont.t.s(12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (widget.suffixWidget != null) ...[widget.suffixWidget!]
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _formMultipleDateInput() {
    return ValueListenableBuilder(
        valueListenable: datesController,
        builder: (context, value, _) {
          DateTime? fromTime = value.isNotEmpty ? value.first : null;
          DateTime? toTime = value.length > 1 ? value.last : null;
          return _container(
            onPressed: () async {
              var results = await Utils.showCalendarDatePicker(
                context,
                value: [fromTime, toTime],
                calendarType: CalendarDatePicker2Type.range,
              );

              if (results != null && results.isNotEmpty) {
                returnDatesSelect(results);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (fromTime == null && toTime == null) ...[
                  Text(
                    widget.hintText ?? '',
                    style: getHintStyle,
                  ),
                ] else ...[
                  Row(
                    children: [
                      if (fromTime != null) ...[
                        Text(
                          fromTime.formatDateTime(
                              format: XDateTimeEnum.dayMonthYear),
                        ),
                      ],
                      if (fromTime != null && toTime != null) ...[
                        BoxSpacer.s16,
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 12.sp,
                          color: AppColors.neutralColor,
                        ),
                        BoxSpacer.s16,
                      ],
                      if (toTime != null) ...[
                        Text(
                          toTime.formatDateTime(
                              format: XDateTimeEnum.dayMonthYear),
                        ),
                      ],
                    ],
                  ),
                ],
                Icon(
                  Icons.calendar_month,
                  size: 18.sp,
                  color: AppColors.neutralColor,
                )
              ],
            ),
          );
        });
  }

  Widget _formSingleDateInput() {
    return ValueListenableBuilder(
        valueListenable: widget.dateController ?? dateController,
        builder: (context, value, _) {
          return _container(
            onPressed: () async {
              var results = await Utils.showCalendarDatePicker(
                context,
                value: [value],
              );

              if (results != null && results.isNotEmpty) {
                returnDatesSelect(results);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (value == null) ...[
                  Text(
                    widget.hintText ?? '',
                    style: getHintStyle,
                  ),
                ] else ...[
                  Text(
                    value.formatDateTime(format: XDateTimeEnum.dayMonthYear),
                  ),
                ],
                Icon(
                  Icons.calendar_month,
                  size: 18.sp,
                  color: AppColors.neutralColor,
                )
              ],
            ),
          );
        });
  }

  Widget _formTimeInput() {
    return ValueListenableBuilder(
        valueListenable: widget.timeController ?? timeController,
        builder: (context, value, _) {
          return _container(
            onPressed: () async {
              final TimeOfDay? newTime =
                  await Utils.showTime(context, initialTime: value);
              if (newTime != null) {
                returnTimeSelect(newTime);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (value == null) ...[
                  Text(
                    widget.hintText ?? '',
                    style: getHintStyle,
                  ),
                ] else ...[
                  Text(
                    '${value.hour}:${value.minute}',
                  ),
                ],
                Icon(
                  Icons.schedule,
                  size: 18.sp,
                  color: AppColors.neutralColor,
                )
              ],
            ),
          );
        });
  }

  Widget _container({required Widget child, Function()? onPressed}) {
    return XBaseButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(
            width: 1.sp,
            color: AppColors.dividerColor,
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _normalTextInput() {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      maxLines: max(widget.minLines, widget.maxLines),
      maxLength: widget.maxLength,
      enabled: widget.isEditMode,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatters,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      focusNode: _focusNode,
      autofocus: widget.autoFocus,
      textCapitalization: widget.textCapitalization,
      decoration: widget.inputDecoration ?? _getDecoration(context),
      obscureText: widget.obsureText,
      textAlign: widget.textAlign,
      style: widget.style ?? AppFont.t.s(12),
      onFieldSubmitted: widget.onSubmitted,
      // onSubmitted: widget.onSubmitted,
      minLines: widget.minLines,
      validator: widget.validator,
    );
  }

  InputDecoration _getDecoration(BuildContext context) {
    switch (widget.decorationStyle) {
      case DecorationStyle.transparent:
        return _noDecoration(context);
      case DecorationStyle.rounded:
        return _roundedDecoration(context);
      case DecorationStyle.search:
        return _searchDecoration(context);
      default:
        return _decoration(context);
    }
  }

  InputDecoration _decoration(BuildContext context) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: BorderSide(color: AppColors.dividerColor.withOpacity(.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: BorderSide(color: AppColors.dividerColor.withOpacity(.5)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: BorderSide(color: AppColors.dividerColor.withOpacity(.5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: BorderSide(color: AppColors.dividerColor.withOpacity(.5)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: BorderSide(color: AppColors.errorColor.withOpacity(.5)),
      ),
      counterText: '',
      alignLabelWithHint: true,
      contentPadding: getContentPadding,
      filled: true,
      hintText: widget.hintText,
      hintStyle: getHintStyle,
      errorText: widget.errorText,
      errorMaxLines: 3,
      fillColor:
          widget.isEditMode ? AppColors.transparent : AppColors.disabledColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  InputDecoration _noDecoration(BuildContext context) {
    return InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      counterText: '',
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.zero,
      filled: true,
      // labelText: widget.isEditMode ? widget.labelText : null,
      hintText: widget.hintText,
      hintStyle: getHintStyle,
      errorText: widget.errorText,
      errorMaxLines: 3,
      fillColor: widget.backgroundColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  InputDecoration _roundedDecoration(BuildContext context) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: BorderSide(color: AppColors.dividerColor.withOpacity(.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(color: AppColors.dividerColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(color: AppColors.dividerColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: BorderSide(color: Colors.red.withOpacity(.5)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: BorderSide(color: AppColors.dividerColor.withOpacity(.5)),
      ),
      counterText: '',
      alignLabelWithHint: true,
      contentPadding: getContentPadding,
      filled: true,
      // labelText: widget.isEditMode ? widget.labelText : null,
      hintText: widget.hintText,
      hintStyle: getHintStyle,
      errorText: widget.errorText,
      errorMaxLines: 3,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      fillColor: widget.backgroundColor,
    );
  }

  InputDecoration _searchDecoration(BuildContext context) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(color: Colors.white),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(color: Colors.white),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.sp),
        borderSide: const BorderSide(color: Colors.white),
      ),
      counterText: '',
      alignLabelWithHint: true,
      contentPadding: getContentPadding,
      filled: true,
      // labelText: widget.isEditMode ? widget.labelText : null,
      hintText: widget.hintText,
      hintStyle: getHintStyle,
      errorText: widget.errorText,
      errorMaxLines: 3,
      fillColor: widget.backgroundColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.sp),
          child: Material(
            elevation: 1.0,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.sp),
            ),
            child: ValueListenableBuilder<List<T>?>(
              valueListenable: items,
              builder: (context, value, _) {
                if (value?.isEmpty ?? true) {
                  return BoxSpacer.blank;
                }
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 300.sp,
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.zero.copyWith(
                      top: 8.sp,
                      bottom: 8.sp,
                      left: 8.sp,
                      right: 8.sp,
                    ),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final T item = value![index];
                      return XBaseButton(
                        onPressed: () => onSelectData(item),
                        child: widget.itemSearchBuilder!(context, index, item),
                      );
                    },
                    separatorBuilder: (context, index) => BoxSpacer.s8,
                    itemCount: value?.length ?? 0,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  ///--- method ---///
  void onSelectData(T dataSelected) {
    if (widget.onSelectData != null) {
      widget.onSelectData!(dataSelected);
      _focusNode.unfocus();
    }
  }

  void returnDatesSelect(List<DateTime?> value) {
    datesController.value = value;
    if (widget.onResultDateSelect != null) {
      widget.onResultDateSelect!(value);
    }
  }

  void returnTimeSelect(TimeOfDay value) {
    timeController.value = value;
    if (widget.onResultTimeSelect != null) {
      widget.onResultTimeSelect!(value);
    }
  }

  void onChanged(String value) async {
    if (widget.onChanged != null) {
      if (value.isNotNullOrEmpty) {
        isClearData.value = true;
      } else {
        isClearData.value = false;
      }
      widget.onChanged!(value);
    }
    if (widget.futureRequest != null) {
      if (_timer?.isActive ?? false) _timer?.cancel();
      _timer = Timer(
          widget.searchDuration ??
              const Duration(milliseconds: AppConstants.timeSearchValue),
          () async {
        items.value = await widget.futureRequest!(value);
      });
    }
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    RegExp phoneRegExp = RegExp(r'^0[0-9]{0,10}$');

    if (phoneRegExp.hasMatch(newValue.text.trim())) {
      return newValue;
    }

    return oldValue;
  }
}

class NumberFormatter extends TextInputFormatter {
  final NumberFormat numberFormat =
      NumberFormat.decimalPattern(); // Sử dụng định dạng số có dấu phẩy

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText =
        newValue.text.replaceAll(',', ''); // Xóa các dấu phẩy để xử lý
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Chuyển đổi chuỗi thành số
    double? newNumber = double.tryParse(newText);
    if (newNumber == null) {
      return oldValue; // Nếu không phải là số, giữ giá trị cũ
    }

    // Định dạng lại chuỗi số với dấu phẩy
    String formattedText = numberFormat.format(newNumber);

    // Trả về giá trị mới với chuỗi đã định dạng
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class PasteTextInputFormatter extends TextInputFormatter {
  final VoidCallback onPaste;

  PasteTextInputFormatter({required this.onPaste});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 1) {
      onPaste(); // Gọi hàm khi phát hiện hành động dán
      return TextEditingValue(
        text: newValue.text[0], // Chỉ lấy ký tự đầu tiên
        selection: const TextSelection.collapsed(offset: 1),
      );
    }
    return newValue;
  }
}
