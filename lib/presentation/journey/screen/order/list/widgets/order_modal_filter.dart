import 'package:c_pos/common/di/injection/injection.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../../../../common/configs/box.dart';
import '../../../../../../common/enum/enum.dart';
import 'package:c_pos/data/models/models.dart';
import '../../../../../theme/themes.dart';
import '../../../../../widgets/widgets.dart';
import '../../../employee/bloc/employee_bloc.dart';
import '../../../store/bloc/store_bloc.dart';

class OrderModalFilter extends StatefulWidget {
  const OrderModalFilter({
    super.key,
    required this.onFilter,
    required this.onDefault,
    required this.status,
    required this.employee,
    required this.fromDay,
    required this.toDay,
    this.store,
  });

  final Function({
    StatusEnum? status,
    EmployeeModel? employee,
    DateTime? fromDay,
    DateTime? toDay,
    StoreModel? store,
  }) onFilter;
  final Function() onDefault;

  final StatusEnum status;
  final EmployeeModel? employee;
  final DateTime? fromDay;
  final DateTime? toDay;
  final StoreModel? store;

  @override
  State<OrderModalFilter> createState() => _OrderModalFilterState();
}

class _OrderModalFilterState extends State<OrderModalFilter> {
  late ValueNotifier<StatusEnum> status;
  late ValueNotifier<EmployeeModel?> employee;
  late ValueNotifier<DateTime?> fromDay;
  late ValueNotifier<DateTime?> toDay;
  late ValueNotifier<StoreModel?> store;

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _employeeController = TextEditingController();

  final StoreBloc _storeBloc = getIt.get<StoreBloc>();
  final EmployeeBloc _employeeBloc = getIt.get<EmployeeBloc>();

  @override
  void initState() {
    super.initState();
    status = ValueNotifier(widget.status);
    employee = ValueNotifier(widget.employee);
    fromDay = ValueNotifier(widget.fromDay);
    toDay = ValueNotifier(widget.toDay);
    store = ValueNotifier(widget.store);
    if (widget.store != null) {
      _controller.text = widget.store!.getName;
    }
    if (widget.employee != null) {
      _employeeController.text = widget.employee!.getFullName;
    }
  }

  @override
  void dispose() {
    status.dispose();
    employee.dispose();
    fromDay.dispose();
    toDay.dispose();
    store.dispose();
    _controller.dispose();
    _employeeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.sp,
      padding: EdgeInsets.all(16.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildEmployee(),
          BoxSpacer.s8,
          _buildFromDay(),
          BoxSpacer.s8,
          _buildToDay(),
          BoxSpacer.s8,
          _store(context),
          BoxSpacer.s8,
          _status(context),
          BoxSpacer.s16,
          _bottom(context)
        ],
      ),
    );
  }

  Widget _store(BuildContext context) {
    return TypeAheadField<StoreModel>(
      controller: _controller,
      itemBuilder: (context, store) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          child: Text(
            store.getName,
            style: AppFont.t.s(),
          ),
        );
      },
      onSelected: (value) {
        store.value = value;
        _controller.text = value.getName;
      },
      suggestionsCallback: (search) => _storeBloc.suggestionsCallback(search),
      constraints: BoxConstraints(maxHeight: 180.sp),
      emptyBuilder: (context) {
        return const EmptyDataWidget(
          emptyMessage: 'Không có cửa hàng trùng khớp',
        );
      },
      builder: (context, controller, focusNode) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cửa hàng',
              style: AppFont.t.s(),
            ),
            BoxSpacer.s4,
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(AppRadius.l),
                border: Border.all(width: 1.sp, color: AppColors.dividerColor),
              ),
              child: XTextField(
                controller: controller,
                focusNode: focusNode,
                hintText: 'Chọn cửa hàng',
                autoFocus: false,
                decorationStyle: DecorationStyle.search,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _bottom(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        XButton(
          title: 'Mặc định',
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          type: XButtonType.secondary,
          onPressed: () {
            status.value = StatusEnum.all;
            employee.value = null;
            fromDay.value = null;
            toDay.value = null;
            store.value = null;
            widget.onDefault();
            Navigator.pop(context);
          },
        ),
        BoxSpacer.s8,
        XButton(
          padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 32.sp),
          title: 'Lọc',
          onPressed: () {
            widget.onFilter(
              status: status.value,
              employee: employee.value,
              fromDay: fromDay.value,
              toDay: toDay.value,
              store: store.value,
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildEmployee() {
    return TypeAheadField<EmployeeModel>(
      controller: _employeeController,
      itemBuilder: (context, employee) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
          child: Text(
            employee.getFullName,
            style: AppFont.t.s(),
          ),
        );
      },
      onSelected: (value) {
        employee.value = value;
        _employeeController.text = value.getFullName;
      },
      suggestionsCallback: (search) => _employeeBloc.searchEmployees(
          value: search, currentEmployees: _employeeBloc.state.employees),
      constraints: BoxConstraints(maxHeight: 180.sp),
      emptyBuilder: (context) {
        return const EmptyDataWidget(
          emptyMessage: 'Không có nhân viên trùng khớp',
        );
      },
      builder: (context, controller, focusNode) {
        return XTextField(
          controller: controller,
          focusNode: focusNode,
          labelText: 'Nhân viên',
          hintText: 'Chọn nhân viên',
          autoFocus: false,
          decorationStyle: DecorationStyle.rounded,
        );
      },
    );
  }

  Widget _buildFromDay() {
    return ValueListenableBuilder(
        valueListenable: fromDay,
        builder: (context, value, _) {
          return XTextField(
            labelText: 'Ngày bắt đầu',
            hintText: 'Chọn ngày bắt đầu',
            textInputStyle: TextInputStyle.selectSingleDate,
            dates: [value],
            onResultDateSelect: (List<DateTime?>? dates) {
              if ((dates ?? []).isNotEmpty) {
                fromDay.value = dates?.first;
              }
            },
          );
        });
  }

  Widget _buildToDay() {
    return ValueListenableBuilder(
        valueListenable: toDay,
        builder: (context, value, _) {
          return XTextField(
            labelText: 'Ngày kết thúc',
            hintText: 'Chọn ngày kết thúc',
            textInputStyle: TextInputStyle.selectSingleDate,
            dates: [value],
          );
        });
  }

  Widget _status(BuildContext context) {
    final List<StatusEnum> statusFilter = [
      StatusEnum.all,
      StatusEnum.confirmed,
      StatusEnum.ready,
      StatusEnum.packing,
      StatusEnum.systemCancel,
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trạng thái',
          style: AppFont.t.s(),
        ),
        BoxSpacer.s4,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...statusFilter.map(
                (e) => ValueListenableBuilder(
                    valueListenable: status,
                    builder: (context, value, _) {
                      return _itemFilter(
                        title: e.getTitle,
                        isSelected: value == e,
                        onPressed: () {
                          status.value = e;
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _itemFilter(
      {required String title, Function()? onPressed, bool isSelected = false}) {
    return XBaseButton(
      padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 4.sp),
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(AppRadius.s),
          color: isSelected ? AppColors.primaryColor : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              offset: const Offset(-1, 1), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
        child: Text(
          title,
          style: AppFont.t.s().copyWith(
                color: !isSelected ? AppColors.neutralColor : AppColors.white,
              ),
        ),
      ),
    );
  }
}
