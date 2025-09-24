part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

final class GetEmployeesEvent extends EmployeeEvent {}

final class GetEmployeesByStoreEvent extends EmployeeEvent {
  final List<int> storeIds;

  GetEmployeesByStoreEvent({required this.storeIds});
}
