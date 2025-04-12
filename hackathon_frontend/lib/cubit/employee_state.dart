import 'package:openapi/openapi.dart';

abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeSuccess extends EmployeeState {
  final String message;

  EmployeeSuccess(this.message);
}

class EmployeeDeleted extends EmployeeState {
  String message;
  EmployeeDeleted(this.message);
}

class EmployeeLoaded extends EmployeeState {
  final List<EmployeeDTO> employees;
  EmployeeLoaded(this.employees);
}

class EmployeeError extends EmployeeState {
  final String message;
  EmployeeError(this.message);
}
