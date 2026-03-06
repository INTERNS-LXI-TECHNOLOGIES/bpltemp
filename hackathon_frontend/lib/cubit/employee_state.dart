import 'package:openapi/openapi.dart';

abstract class EmployeeState {
   final List<CompanyDTO> companies;

  EmployeeState({this.companies = const []});
}

class EmployeeInitial extends EmployeeState {
   EmployeeInitial() : super();
}

class EmployeeLoading extends EmployeeState {
  EmployeeLoading() : super();
}

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
  EmployeeLoaded(this.employees, {super.companies});
}

class EmployeeError extends EmployeeState {
   final String message;
  EmployeeError(this.message) : super();
}
