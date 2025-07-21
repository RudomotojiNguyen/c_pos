import 'dart:async';

import 'package:c_pos/common/extensions/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/employee_model.dart';
import '../../../../../data/repository/employee_repositories.dart';
import '../../../../mixins/logger_helper.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepositories employeeRepositories;
  final LoggerHelper _loggerHelper = LoggerHelper();

  EmployeeBloc(this.employeeRepositories)
      : super(const EmployeeInitial(employees: [], isLoading: false)) {
    on<GetEmployeesEvent>(_onGetEmployees);
  }

  FutureOr<void> _onGetEmployees(
      GetEmployeesEvent event, Emitter<EmployeeState> emit) async {
    try {
      emit(UpdateLoadingState(state: state, isLoading: true));
      final res = await employeeRepositories.getEmployees();
      emit(UpdateEmployeesData(state: state, employees: res));
    } catch (e) {
      _loggerHelper.logError(message: 'GetEmployeesEvent', obj: e);
    } finally {
      emit(UpdateLoadingState(state: state, isLoading: false));
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
