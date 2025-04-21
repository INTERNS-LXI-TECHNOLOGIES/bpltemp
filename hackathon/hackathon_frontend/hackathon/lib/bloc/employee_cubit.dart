import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:openapi/openapi.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit() : super(EmployeeInitial());

  final String jwtToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0NTI5NjAxMiwiYXV0aCI6IlJPTEVfQURNSU4gUk9MRV9VU0VSIiwiaWF0IjoxNzQ1MjA5NjEyfQ.LnrMCEQzG41tFUoHrGFycvVee2sIj8GEJDzEHseTDDhZA9xIiUqBDrgxClHE6u-9C_leVpqGnGypjK3qAgu9Sw";

  void fetchEmployees() async {
    emit(EmployeeLoading());
    try {
      final response = await Openapi().getEmployeeResourceApi().getAllEmployees(
        employeeDTO: EmployeeDTOBuilder(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200 && response.data != null) {
        final employeesList = response.data!.toList();
        final employees = employeesList.map((employee) {
          String? companyName;
          String? companyId;

          if (employee.company != null) {
            companyName = employee.company!.name ?? 'N/A';
            companyId = employee.company!.id?.toString();
          }

          return {
            'id': employee.id?.toString(),
            'name': employee.name,
            'position': employee.position,
            'email': employee.email,
            'company': companyName,
            'companyId': companyId,
          };
        }).toList();

        emit(EmployeeLoaded(employees));
      } else {
        emit(EmployeeError('Failed to fetch employees'));
      }
    } catch (e) {
      emit(EmployeeError('Error occurred while fetching employees: $e'));
    }
  }

  void fetchCompanies() async {
    try {
      final response = await Openapi().getCompanyResourceApi().getAllCompanies(
        companyDTO: CompanyDTOBuilder(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200 && response.data != null) {
        emit(CompaniesLoaded(response.data!.toList()));
      } else {
        emit(EmployeeError('Failed to fetch companies'));
      }
    } catch (e) {
      emit(EmployeeError('Error occurred while fetching companies: $e'));
    }
  }

  void updateEmployee(Map<String, String?> employee) async {
    // Implement update logic here
  }

  void deleteEmployee(String? employeeId) async {
    // Implement delete logic here
  }
}
