part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState extends Equatable {
  final List<EmployeeModel> employees;

  const EmployeeState({
    required this.employees,
  });

  @override
  List<Object?> get props => [employees];
}

final class EmployeeInitial extends EmployeeState {
  const EmployeeInitial({required super.employees});
}

final class UpdateLoadingState extends EmployeeState {
  UpdateLoadingState({
    required EmployeeState state,
  }) : super(
          employees: state.employees,
        );
}

final class UpdateEmployeesData extends EmployeeState {
  const UpdateEmployeesData({
    required EmployeeState state,
    required super.employees,
  }) : super();
}
