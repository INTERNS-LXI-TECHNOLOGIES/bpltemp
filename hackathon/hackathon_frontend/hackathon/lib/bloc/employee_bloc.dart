import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'employee_event.dart';
import 'employee_state.dart';
import 'package:dio/dio.dart'; // Import Dio for better error handling

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final String jwtToken;

  EmployeeBloc(this.jwtToken) : super(EmployeeInitial()) {
    on<FetchEmployees>(_onFetchEmployees);
    on<CreateEmployee>(_onCreateEmployee);
    on<UpdateEmployee>(_onUpdateEmployee);
    on<DeleteEmployee>(_onDeleteEmployee);
  }

  Future<void> _onFetchEmployees(FetchEmployees event, Emitter<EmployeeState> emit) async {
    emit(EmployeeLoadInProgress());
    try {
      final response = await Openapi().getEmployeeResourceApi().getAllEmployees(employeeDTO: EmployeeDTOBuilder(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      print('API Response: ${response.data}'); // Log the API response

      if (response.statusCode == 200 && response.data != null) {
        emit(EmployeeLoadSuccess(response.data!.toList()));
      } else {
        emit(EmployeeLoadFailure());
        print('Failed to fetch employees: ${response.statusCode}');
      }
    } on DioException catch (e) {
      emit(EmployeeLoadFailure());
      if (e.response?.statusCode == 401) {
        print('Unauthorized: Invalid or expired JWT token');
      } else {
        print('Error fetching employees: $e');
      }
    } catch (e) {
      emit(EmployeeLoadFailure());
      print('Error fetching employees: $e');
    }
  }

  Future<void> _onCreateEmployee(CreateEmployee event, Emitter<EmployeeState> emit) async {
    try {
      final response = await Openapi().getEmployeeResourceApi().createEmployee(
        employeeDTO: event.employee,
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      print('API Response: ${response.data}'); // Log the API response

      if (response.statusCode == 201) {
        add(FetchEmployees());
      } else {
        print('Failed to create employee: ${response.statusCode}');
      }
    } on DioException catch (e) {
      emit(EmployeeLoadFailure());
      if (e.response?.statusCode == 401) {
        print('Unauthorized: Invalid or expired JWT token');
      } else {
        print('Error creating employee: $e');
      }
    } catch (e) {
      emit(EmployeeLoadFailure());
      print('Error creating employee: $e');
    }
  }

  Future<void> _onUpdateEmployee(UpdateEmployee event, Emitter<EmployeeState> emit) async {
    try {
      final response = await Openapi().getEmployeeResourceApi().updateEmployee(
        id: event.employee.id!,
        employeeDTO: event.employee,
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      print('API Response: ${response.data}'); // Log the API response

      if (response.statusCode == 200) {
        add(FetchEmployees());
      } else {
        print('Failed to update employee: ${response.statusCode}');
      }
    } on DioException catch (e) {
      emit(EmployeeLoadFailure());
      if (e.response?.statusCode == 401) {
        print('Unauthorized: Invalid or expired JWT token');
      } else {
        print('Error updating employee: $e');
      }
    } catch (e) {
      emit(EmployeeLoadFailure());
      print('Error updating employee: $e');
    }
  }

  Future<void> _onDeleteEmployee(DeleteEmployee event, Emitter<EmployeeState> emit) async {
    try {
      final response = await Openapi().getEmployeeResourceApi().deleteEmployee(
        id: int.parse(event.employeeId),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );


      if (response.statusCode == 200 || response.statusCode == 204) {
        add(FetchEmployees());
      } else {
        print('Failed to delete employee: ${response.statusCode}');
      }
    } on DioException catch (e) {
      emit(EmployeeLoadFailure());
      if (e.response?.statusCode == 401) {
        print('Unauthorized: Invalid or expired JWT token');
      } else {
        print('Error deleting employee: $e');
      }
    } catch (e) {
      emit(EmployeeLoadFailure());
      print('Error deleting employee: $e');
    }
  }
}
