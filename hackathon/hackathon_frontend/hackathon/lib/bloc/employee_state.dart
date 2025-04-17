import 'package:equatable/equatable.dart';
import 'package:openapi/openapi.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoadInProgress extends EmployeeState {}

class EmployeeLoadSuccess extends EmployeeState {
  final List<EmployeeDTO> employees;

  const EmployeeLoadSuccess(this.employees);

  @override
  List<Object> get props => [employees];
}

class EmployeeLoadFailure extends EmployeeState {}
