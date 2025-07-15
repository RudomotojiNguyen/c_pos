import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/configs/box.dart';
import '../../../common/extensions/extension.dart';
import '../../theme/themes.dart';
import '../widgets.dart';

export 'package:animated_custom_dropdown/custom_dropdown.dart';

enum DropdownType {
  normal,
  searchDropdown,
  searchRequest,
  multiSelect,
  multiSelectSearch,
  multiSelectSearchRequest
}

class XBasicDropDown<T> extends StatelessWidget {
  final List<T>? items;
  final String hintText;
  final String? searchHintText;
  final String? labelText;
  final bool isRequired;
  final bool excludeSelected;
  final Function(T?)? onChanged;
  final Function(List<T>)? onListChanged;
  final DropdownType dropdownType;
  final Future<List<T>> Function(String)? futureRequest;
  final bool validateOnChange;
  final String? Function(T?)? validator;
  final String? Function(List<T>)? listValidator;
  final Duration? futureRequestDelay;
  final String? noResultFoundText;
  final Widget Function(BuildContext, T, bool)? headerBuilder;
  final Widget Function(BuildContext, List<T>, bool)? headerListBuilder;
  final Widget Function(BuildContext, String, bool)? hintBuilder;
  final Widget Function(BuildContext, String)? noResultFoundBuilder;
  final Widget Function(BuildContext, T, bool, VoidCallback)? listItemBuilder;
  final EdgeInsets? itemsListPadding;
  final EdgeInsets? listItemPadding;
  final EdgeInsets? expandedHeaderPadding;
  final bool enabled;
  final CustomDropdownDecoration? decoration;
  final CustomDropdownDisabledDecoration? disabledDecoration;
  final T? initialItem;
  final SingleSelectController<T?>? selectedItemNotifier;
  final bool hideSelectedFieldWhenExpanded;

  //
  final Widget? searchRequestLoadingIndicator;

  const XBasicDropDown({
    super.key,
    this.items,
    required this.hintText,
    this.onChanged,
    this.futureRequest,
    this.validator,
    this.listValidator,
    this.onListChanged,
    this.futureRequestDelay,
    this.headerBuilder,
    this.headerListBuilder,
    this.hintBuilder,
    this.noResultFoundBuilder,
    this.noResultFoundText,
    this.itemsListPadding,
    this.listItemPadding,
    this.expandedHeaderPadding,
    this.decoration,
    this.disabledDecoration,
    this.searchHintText,
    this.labelText,
    this.searchRequestLoadingIndicator,
    this.listItemBuilder,
    this.validateOnChange = false,
    this.isRequired = false,
    this.enabled = true,
    this.excludeSelected = false,
    this.hideSelectedFieldWhenExpanded = true,
    this.dropdownType = DropdownType.normal,
    this.initialItem,
    this.selectedItemNotifier,
  });

  CustomDropdownDecoration? getDecoration(BuildContext ctx) =>
      decoration ??
      CustomDropdownDecoration(
        searchFieldDecoration: SearchFieldDecoration(
            textStyle: AppFont.t.s(12),
            prefixIcon: Icon(
              Icons.search,
              size: 16.sp,
              color: AppColors.neutralColor,
            )),
      );

  CustomDropdownDisabledDecoration? get getDisabledDecoration =>
      disabledDecoration;

  EdgeInsets? get getExpandedHeaderPadding =>
      expandedHeaderPadding ?? EdgeInsets.zero;

  EdgeInsets? get getClosedHeaderPadding => EdgeInsets.zero;

  Widget Function(BuildContext, T, bool, VoidCallback)?
      get renderListItemBuilder => listItemBuilder;

  Widget Function(BuildContext, List<T>, bool)? get getHeaderListBuilder =>
      headerListBuilder;

  @override
  Widget build(BuildContext context) {
    final Widget dropdownWidget;
    switch (dropdownType) {
      case DropdownType.normal:
        dropdownWidget = _renderNormalDropDown(context);
        break;
      case DropdownType.searchDropdown:
        dropdownWidget = _renderSearchDropDown(context);
        break;
      case DropdownType.searchRequest:
        dropdownWidget = _renderSearchRequestDropDown(context);
        break;
      case DropdownType.multiSelect:
        dropdownWidget = _renderMultiSelectDropDown(context);
        break;
      default:
        dropdownWidget = BoxSpacer.blank;
        break;
    }

    return Column(
      children: [
        if (labelText?.isNotEmpty ?? false) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                labelText ?? '',
                style: AppFont.t.s(12),
              ),
              if (isRequired) ...[
                Text(
                  ' *',
                  style: AppFont.t.s(12).primaryColor,
                ),
              ],
            ],
          ),
          SizedBox(height: 8.0.sp),
        ],
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(AppRadius.xxm),
              border: Border.all(
                color: AppColors.dividerColor,
                width: 0.5.sp,
              )),
          child: dropdownWidget,
        ),
      ],
    );
  }

  Widget _renderNormalDropDown(BuildContext context) {
    return CustomDropdown<T>(
      hintText: hintText,
      excludeSelected: excludeSelected,
      items: items,
      validateOnChange: validateOnChange,
      validator: validator,
      onChanged: onChanged,
      hintBuilder: hintBuilder,
      headerBuilder: headerBuilder,
      enabled: enabled,
      decoration: getDecoration(context),
      disabledDecoration: getDisabledDecoration,
      closedHeaderPadding: getClosedHeaderPadding,
      expandedHeaderPadding: getExpandedHeaderPadding,
      listItemBuilder: renderListItemBuilder,
      initialItem: initialItem,
      controller: selectedItemNotifier,
      hideSelectedFieldWhenExpanded: hideSelectedFieldWhenExpanded,
    );
  }

  Widget _renderSearchDropDown(BuildContext context) {
    return CustomDropdown<T>.search(
      hintText: hintText,
      excludeSelected: excludeSelected,
      items: items,
      validateOnChange: validateOnChange,
      validator: validator,
      onChanged: onChanged,
      headerBuilder: headerBuilder,
      hintBuilder: hintBuilder,
      noResultFoundBuilder: noResultFoundBuilder,
      noResultFoundText: noResultFoundText,
      enabled: enabled,
      decoration: getDecoration(context),
      disabledDecoration: getDisabledDecoration,
      closedHeaderPadding: getClosedHeaderPadding,
      expandedHeaderPadding: getExpandedHeaderPadding,
      searchHintText: searchHintText,
      listItemBuilder: renderListItemBuilder,
      initialItem: initialItem,
      controller: selectedItemNotifier,
      hideSelectedFieldWhenExpanded: hideSelectedFieldWhenExpanded,
    );
  }

  Widget _renderSearchRequestDropDown(BuildContext context) {
    return CustomDropdown<T>.searchRequest(
      futureRequest: futureRequest,
      hintText: hintText,
      excludeSelected: excludeSelected,
      validateOnChange: validateOnChange,
      validator: validator,
      onChanged: onChanged,
      futureRequestDelay: futureRequestDelay,
      hintBuilder: hintBuilder,
      noResultFoundBuilder: noResultFoundBuilder,
      noResultFoundText: noResultFoundText,
      itemsListPadding: itemsListPadding,
      listItemPadding: listItemPadding,
      headerBuilder: headerBuilder,
      closedHeaderPadding: getClosedHeaderPadding,
      expandedHeaderPadding: getExpandedHeaderPadding,
      enabled: enabled,
      decoration: getDecoration(context),
      disabledDecoration: getDisabledDecoration,
      searchHintText: searchHintText,
      listItemBuilder: renderListItemBuilder,
      initialItem: initialItem,
      controller: selectedItemNotifier,
      hideSelectedFieldWhenExpanded: hideSelectedFieldWhenExpanded,
    );
  }

  Widget _renderMultiSelectDropDown(BuildContext context) {
    return CustomDropdown<T>.multiSelect(
      hintText: hintText,
      items: items,
      initialItems: items?.take(1).toList(),
      validateOnChange: validateOnChange,
      listValidator: listValidator,
      onListChanged: onListChanged,
      headerListBuilder: getHeaderListBuilder,
      itemsListPadding: itemsListPadding,
      listItemPadding: listItemPadding,
      hintBuilder: hintBuilder,
      enabled: enabled,
      decoration: getDecoration(context),
      disabledDecoration: getDisabledDecoration,
      closedHeaderPadding: getClosedHeaderPadding,
      expandedHeaderPadding: getExpandedHeaderPadding,
      listItemBuilder: renderListItemBuilder,
      controller: selectedItemNotifier,
      hideSelectedFieldWhenExpanded: hideSelectedFieldWhenExpanded,
    );
  }
}
