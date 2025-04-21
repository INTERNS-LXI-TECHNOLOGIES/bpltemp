part of 'employee_cubit.dart';

abstract class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState {
  final List<Map<String, String?>> employees;

  EmployeeLoaded(this.employees);

  @override
  List<Object> get props => [employees];
}

class CompaniesLoaded extends EmployeeState {
  final List<CompanyDTO> companies;

  CompaniesLoaded(this.companies);

  @override
  List<Object> get props => [companies];
}

class EmployeeError extends EmployeeState {
  final String message;

  EmployeeError(this.message);

  @override
  List<Object> get props => [message];
}
