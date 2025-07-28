import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:c_pos/data/models/models.dart';
import '../../../../../data/services/services.dart';
import '../../../../mixins/logger_helper.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeServices employeeServices;
  final LoggerHelper _loggerHelper = LoggerHelper();

  EmployeeBloc(this.employeeServices)
      : super(const EmployeeInitial(employees: [])) {
    on<GetEmployeesEvent>(_onGetEmployees);
  }

  FutureOr<void> _onGetEmployees(
      GetEmployeesEvent event, Emitter<EmployeeState> emit) async {
    try {
      emit(UpdateLoadingState(state: state));
      final res = await employeeServices.getEmployees();
      emit(UpdateEmployeesData(state: state, employees: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetEmployeesEvent', obj: e);
      emit(UpdateEmployeesData(state: state, employees: const []));
    }
  }
}

extension EmployeeBlocExtension on EmployeeBloc {
  List<EmployeeModel> searchEmployees({
    String? value,
    List<EmployeeModel> currentEmployees = const [],
  }) {
    final currentValue = (value ?? '').toStrSearch;
    final result = currentEmployees
        .where(
          (element) =>
              element.getFullName.toStrSearch.contains(currentValue) ||
              element.getCode.toStrSearch.contains(currentValue),
        )
        .toList();
    return result.isEmpty ? currentEmployees : result;
  }
}
