import 'package:bpl/cubit/employee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final Openapi _openapi = Openapi(); // Initialize OpenAPI client
  EmployeeCubit(Openapi openapi) : super(EmployeeInitial()); // Initial state

  Future<void> fetchEmployees() async {
    emit(EmployeeLoading());
    try {
      final response = await _openapi.getEmployeeResourceApi().getAllEmployees(
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );
      if (response.data != null) {
        emit(EmployeeLoaded(response.data!.toList())); // Emit loaded state
      } else {
        emit(EmployeeError("No data found")); // Emit error if data null
      }
    } catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }

  Future<void> createEmployee({
    required String name,
    required String position,
    required String email,
    // required int company,
  }) async {
    try {
      emit(EmployeeLoading());

      // Build the company reference
      final companyBuilder = CompanyDTOBuilder()..name = name;

      // Build the employee with company assignment
      final employeeBuilder = EmployeeDTOBuilder()
        ..name = name
        ..position = position
        ..email = email;
      //  ..company = companyBuilder;

      final response = await _openapi.getEmployeeResourceApi().createEmployee(
        employeeDTO: employeeBuilder.build(),
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Refresh the employee list including the company assignment
        await fetchEmployees();
      } else {
        throw Exception(
            'Failed to create employee (Status code: ${response.statusCode})');
      }
    } catch (e) {
      emit(EmployeeError('Failed to create employee: ${e.toString()}'));
    }
  }

  Future<void> deleteEmployee(int employeeId) async {
    try {
      emit(EmployeeLoading());

      final response = await _openapi.getEmployeeResourceApi().deleteEmployee(
        id: employeeId,
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        emit(EmployeeDeleted(""));
        await fetchEmployees(); // Refresh the list after deletion
      } else {
        throw Exception(
            'Failed to delete employee (Status code: ${response.statusCode})');
      }
    } catch (e) {
      emit(EmployeeError('Failed to delete employee: ${e.toString()}'));
      rethrow;
    }
  }
}
