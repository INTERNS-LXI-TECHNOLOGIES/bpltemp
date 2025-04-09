import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for EmployeeResourceApi
void main() {
  final instance = Openapi().getEmployeeResourceApi();

  group(EmployeeResourceApi, () {
    //Future<EmployeeDTO> createEmployee(EmployeeDTO employeeDTO) async
    test('test createEmployee', () async {
      // TODO
    });

    //Future deleteEmployee(int id) async
    test('test deleteEmployee', () async {
      // TODO
    });

    //Future<BuiltList<EmployeeDTO>> getAllEmployees({ int page, int size, BuiltList<String> sort }) async
    test('test getAllEmployees', () async {
      // TODO
    });

    //Future<EmployeeDTO> getEmployee(int id) async
    test('test getEmployee', () async {
      // TODO
    });

    //Future<EmployeeDTO> partialUpdateEmployee(int id, EmployeeDTO employeeDTO) async
    test('test partialUpdateEmployee', () async {
      // TODO
    });

    //Future<EmployeeDTO> updateEmployee(int id, EmployeeDTO employeeDTO) async
    test('test updateEmployee', () async {
      // TODO
    });

  });
}
