import 'package:bpl/cubit/employee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final Openapi _openapi = Openapi(); // Initialize OpenAPI client
  EmployeeCubit(Openapi openapi) : super(EmployeeInitial()); // Initial state

  Future<void> fetchEmployees({required int companyId}) async {
    emit(EmployeeLoading());
    try {
      final response =
          await _openapi.getEmployeeResourceApi().getAllEmployees( headers: {'Authorization': 'Bearer ${Openapi.jwt}'},);
          if (response.data != null) {
        emit(EmployeeLoaded(response.data!.toList())); // Emit loaded state
       } else {
        emit(EmployeeError("No data found")); // Emit error if data null
    } }catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }


  Future<void> createEmployee({
  required String name,
  required String position,
  required String email,
  required int companyId,
}) async {
  try {
    final employeeBuilder = EmployeeDTOBuilder()
      ..name = name
      ..position = position
      ..email = email;

    final response = await _openapi.getEmployeeResourceApi().createEmployee(
     
      employeeDTO: employeeBuilder.build(),
      headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
    );

    if (response.data != null) {
      emit(EmployeeSuccess('Employee Created Successfully'));
      fetchEmployees(companyId: companyId); // Refresh List
    } else {
      emit(EmployeeError('Failed to Create Employee'));
    }
  } catch (e) {
    emit(EmployeeError('Failed to Create Employee'));
  }
}

}
