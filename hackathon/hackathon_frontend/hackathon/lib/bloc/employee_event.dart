import 'package:equatable/equatable.dart';
import 'package:openapi/openapi.dart';

abstract class EmployeeEvent extends Equatable {
  const EmployeeEvent();

  @override
  List<Object> get props => [];
}

class FetchEmployees extends EmployeeEvent {}

class CreateEmployee extends EmployeeEvent {
  final EmployeeDTO employee;

  const CreateEmployee(this.employee);

  @override
  List<Object> get props => [employee];
}

class UpdateEmployee extends EmployeeEvent {
  final EmployeeDTO employee;

  const UpdateEmployee(this.employee);

  @override
  List<Object> get props => [employee];
}

class DeleteEmployee extends EmployeeEvent {
  final String employeeId;

  const DeleteEmployee(this.employeeId);

  @override
  List<Object> get props => [employeeId];
}
