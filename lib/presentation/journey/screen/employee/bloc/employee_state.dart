part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState extends Equatable {
  final List<EmployeeModel> employees;
  final bool isLoading;

  const EmployeeState({
    required this.employees,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [employees, isLoading];
}

final class EmployeeInitial extends EmployeeState {
  const EmployeeInitial({required super.employees, required super.isLoading});
}

final class UpdateLoadingState extends EmployeeState {
  UpdateLoadingState({
    required EmployeeState state,
    required super.isLoading,
  }) : super(
          employees: state.employees,
        );
}

final class UpdateEmployeesData extends EmployeeState {
  UpdateEmployeesData({
    required EmployeeState state,
    required super.employees,
  }) : super(
          isLoading: state.isLoading,
        );
}
