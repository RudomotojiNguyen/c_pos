part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

final class GetEmployeesEvent extends EmployeeEvent {
  final int? storeId;

  GetEmployeesEvent({this.storeId});
}
