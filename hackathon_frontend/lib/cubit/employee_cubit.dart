import 'package:bpl/cubit/employee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final Openapi _openapi = Openapi(); // Initialize OpenAPI client
  EmployeeCubit(Openapi openapi) : super(EmployeeInitial()); // Initial state
  String? _selectedCompanyId;

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

 Future<void> createEmployeeWithNewCompany({
  required String employeeName,
  required String position,
  required String email,
  required String companyName,
}) async {
  try {
    emit(EmployeeLoading());

    // Step 1: Create Company
    final companyBuilder = CompanyDTOBuilder()..name = companyName;

    final companyResponse = await _openapi.getCompanyResourceApi().createCompany(
      companyDTO: companyBuilder.build(),
      headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
    );

    if (companyResponse.statusCode != 201 || companyResponse.data == null) {
      throw Exception('Failed to create company');
    }

    final companyDTO = companyResponse.data!;

    // Step 2: Create Employee with returned Company (contains the ID)
    final employeeBuilder = EmployeeDTOBuilder()
      ..name = employeeName
      ..position = position
      ..email = email
      ..company = companyDTO.toBuilder();

    final employeeResponse = await _openapi.getEmployeeResourceApi().createEmployee(
      employeeDTO: employeeBuilder.build(),
      headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
    );

    if (employeeResponse.statusCode == 201) {
      emit(EmployeeLoaded(employeeResponse.data! as List<EmployeeDTO>));
      await fetchEmployees();
    } else {
      throw Exception('Failed to create employee');
    }
  } catch (e) {
    emit(EmployeeError('Creation failed: ${e.toString()}'));
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
