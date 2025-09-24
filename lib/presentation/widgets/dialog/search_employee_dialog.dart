import 'dart:async';

import 'package:c_pos/common/constants/app_constants.dart';
import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/di/injection/injection.dart';
import 'package:c_pos/data/models/models.dart';
import '../../journey/screen/employee/bloc/employee_bloc.dart';
import '../widgets.dart';

class SearchEmployeeDialog extends StatefulWidget {
  const SearchEmployeeDialog({super.key, required this.employees});

  final List<EmployeeModel> employees;

  @override
  State<SearchEmployeeDialog> createState() => _SearchEmployeeDialogState();
}

class _SearchEmployeeDialogState extends State<SearchEmployeeDialog> {
  final TextEditingController _searchTextController = TextEditingController();
  final EmployeeBloc _employeeBloc = getIt.get<EmployeeBloc>();
  final ValueNotifier<List<EmployeeModel>> employees = ValueNotifier([]);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    employees.value = widget.employees;
  }

  @override
  void dispose() {
    employees.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderDialog(title: 'Tìm nhân viên'),
        const XDivider(),
        Expanded(child: _listSearch()),
        _header(),
      ],
    );
  }

  Widget _listSearch() {
    return Expanded(
      child: ValueListenableBuilder(
          valueListenable: employees,
          builder: (context, value, _) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final EmployeeModel employee = value[index];
                return XBaseButton(
                  key: ValueKey(employee.id),
                  onPressed: () {
                    Navigator.pop(context, employee);
                  },
                  padding: EdgeInsets.symmetric(vertical: 8.sp),
                  child: Text.rich(
                    TextSpan(
                        text: employee.getFullName,
                        style: AppFont.t.s(),
                        children: [
                          if (employee.getCode.isNotEmpty) ...[
                            const TextSpan(
                              text: ' - ',
                            ),
                            TextSpan(
                              text: employee.getCode,
                            ),
                          ],
                        ]),
                  ),
                );
              },
              separatorBuilder: (context, index) => const XDivider(),
              itemCount: value.length,
            );
          }),
    );
  }

  Widget _header() {
    return SearchBoxWidget(
      onSearch: _onChangeText,
      searchController: _searchTextController,
      hintStr: 'Nhập tên ',
    );
  }

  ///--- method ---///
  _onChangeText(String? value) {
    if (_timer?.isActive ?? false) _timer?.cancel();
    _timer =
        Timer(const Duration(milliseconds: AppConstants.timeSearchValue), () {
      final newData = _employeeBloc.searchEmployees(
          value: value, currentEmployees: widget.employees);

      employees.value = newData;
    });
  }
}
