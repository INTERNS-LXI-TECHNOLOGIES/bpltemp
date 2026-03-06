import 'dart:convert';

import 'package:bpl/cubit/employee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final Openapi _openapi = Openapi(); 
  EmployeeCubit(Openapi openapi) : super(EmployeeInitial()); 
  String? _selectedCompanyId;
  

 Future<void> fetchEmployees() async {
  emit(EmployeeLoading());
  try {
    final response = await _openapi.getEmployeeResourceApi().getAllEmployees(
      headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
    );
    print('Raw response: ${response.data}');
print('Status code: ${response.statusCode}');
    
    if (response.data != null) {
      final employees = response.data! is List 
          ? response.data! as List<EmployeeDTO>
          : [response.data! as EmployeeDTO];
          
      emit(EmployeeLoaded(employees));
    } else {
      emit(EmployeeError("No data found"));
    }
  } catch (e) {
    emit(EmployeeError("Failed to fetch employees: ${e.toString()}"));
  }
}

Future<void> createEmployeeWithNewCompany({
  required String employeeName,
  required String position,
  required String email,
   String? companyName,
  int? companyId, 
}) async {
  emit(EmployeeLoading());
  
  try {
    CompanyDTO company;
    
   
    if (companyId != null) {
      final companyResponse = await _openapi.getCompanyResourceApi().getCompany(
        id: companyId ,
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );
      
      if (companyResponse.data == null) {
        throw Exception('Company not found');
      }
      company = companyResponse.data!;
    } 
    
    else {
      final companyBuilder = CompanyDTOBuilder()..name = companyName;
      
      final companyResponse = await _openapi.getCompanyResourceApi().createCompany(
        companyDTO: companyBuilder.build(),
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );
      
      if (companyResponse.data == null) {
        throw Exception('Failed to create company');
      }
      company = companyResponse.data!;
    }

   
    final employeeBuilder = EmployeeDTOBuilder()
      ..name = employeeName
      ..position = position
      ..email = email
      ..company = company.toBuilder();

    final employeeResponse = await _openapi.getEmployeeResourceApi().createEmployee(
      employeeDTO: employeeBuilder.build(),
      headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
    );

final Map<String, dynamic> parsedJson = jsonDecode(employeeResponse.data!.toString());
if (parsedJson['name'] == null) {
  debugPrint('Warning: Employee ${parsedJson['id']} has null name');

  
}
    if (employeeResponse.statusCode == 201) {
      await fetchEmployees(); 
    } else {
      throw Exception('Failed to create employee');
    }
  } catch (e) {
    emit(EmployeeError(e.toString()));
    rethrow;
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
        await fetchEmployees();
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
