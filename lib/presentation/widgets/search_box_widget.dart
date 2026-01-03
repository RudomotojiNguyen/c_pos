import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/configs/box.dart';
import '../theme/themes.dart';
import 'button/base_button.dart';
import 'x_linked_overlay_wrapper.dart';
import 'x_textfield.dart';

class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({
    super.key,
    required this.onSearch,
    required this.hintStr,
    this.searchController,
    this.filterWidget,
    this.isFilter = false,
    this.suffixWidget,
    this.filterController,
  });

  final Function(String searchValue) onSearch;
  final String hintStr;
  final TextEditingController? searchController;
  final Widget? filterWidget;
  final bool isFilter;
  final Widget? suffixWidget;
  final LinkedOverlayController? filterController;

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  Timer? _timer;
  late LinkedOverlayController _filterController;

  @override
  void initState() {
    super.initState();
    _filterController = widget.filterController ?? LinkedOverlayController();
  }

  @override
  void dispose() {
    widget.searchController?.dispose();
    _timer?.cancel();
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(AppRadius.xxxl),
        boxShadow: context.boxShadow,
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.iconColor,
          ),
          BoxSpacer.s16,
          Expanded(
            child: XTextField(
              controller: widget.searchController,
              onChanged: _onChangeText,
              hintText: widget.hintStr,
              decorationStyle: DecorationStyle.search,
              contentPadding: EdgeInsets.zero,
              autoFocus: false,
              suffixWidget: widget.suffixWidget,
            ),
          ),
          if (widget.filterWidget != null) ...[
            BoxSpacer.s4,
            XLinkedOverlayWrapper(
              controller: _filterController,
              matchChildWidth: false,
              scrimColor: AppColors.neutralColor.withValues(alpha: 0.1),
              overlayContentBuilder: (context, showAbove, maxOverlayHeight) {
                return Material(
                  elevation: 1.0,
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(AppRadius.l),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16.sp),
                    child: SingleChildScrollView(
                      child: widget.filterWidget!,
                    ),
                  ),
                );
              },
              child: XBaseButton(
                onPressed: () {
                  if (_filterController.isOpen) {
                    _filterController.hide();
                  } else {
                    _filterController.show();
                  }
                },
                child: Stack(
                  children: [
                    Icon(
                      Icons.tune,
                      color: AppColors.iconColor,
                      size: 20.sp,
                    ),
                    if (widget.isFilter)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 4.sp,
                          backgroundColor: AppColors.primaryColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  ///--- method ---///
  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      widget.onSearch((value ?? '').trim());
    });
  }
}
