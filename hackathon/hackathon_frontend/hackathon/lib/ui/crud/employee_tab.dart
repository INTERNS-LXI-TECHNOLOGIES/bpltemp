import 'package:flutter/material.dart';
import 'package:hackathon/validation/validators.dart';
import 'package:openapi/openapi.dart';

class EmployeeTab extends StatefulWidget {
  @override
  _EmployeeTabState createState() => _EmployeeTabState();
}

class _EmployeeTabState extends State<EmployeeTab> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _positionController = TextEditingController();
  final _emailController = TextEditingController();
  final _editNameController = TextEditingController();
  final _editPositionController = TextEditingController();
  final _editEmailController = TextEditingController();
  bool _isCreatingEmployee = false;
  String jwtToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0NDYyMjc2OCwiYXV0aCI6IlJPTEVfQURNSU4gUk9MRV9VU0VSIiwiaWF0IjoxNzQ0NTM2MzY4fQ.hn0OF1HooqYUB1Wo4s_XHVUpr0PgbtuPBkOK0m5DgQmLIPZ4dQ5KTknIDP8xD0UVA6IQbWmTclxJjCfWrqpWLQ";

  final List<Map<String, String>> _employees = [];

  void _readMethod() async {
    try {
      final response = await Openapi().getEmployeeResourceApi().getAllEmployees(employeeDTO: EmployeeDTOBuilder(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200 && response.data != null) {
        final employeesList = response.data!.toList();

        setState(() {
          _employees.clear();
          for (var employee in employeesList) {
            _employees.add({
              'id': employee.id?.toString() ?? 'N/A',
              'name': employee.name ?? 'N/A',
              'position': employee.position ?? 'N/A',
              'email': employee.email ?? 'N/A',
            });
          }
        });

        print('Employees fetched successfully!');
      } else {
        print('Failed to fetch employees. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching employees: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DropdownButton<String>(
            hint: Text('Select Company'),
            value: null,
            onChanged: (String? newValue) {},
            items: [],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isCreatingEmployee = !_isCreatingEmployee;
              });
            },
            child: Text(_isCreatingEmployee ? 'Cancel' : 'Create Employee'),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: _readMethod, child: Text('Fetch Employees')),
          if (_isCreatingEmployee)
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Employee Name'),
                    validator: Validators.validateName,
                  ),
                  TextFormField(
                    controller: _positionController,
                    decoration: InputDecoration(labelText: 'Position'),
                    validator: (value) => Validators.validateRequired(value, fieldName: 'Position'),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: Validators.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final employeeDTOBuilder = EmployeeDTOBuilder()
                          ..name = _nameController.text.trim()
                          ..position = _positionController.text.trim()
                          ..email = _emailController.text.trim();

                        try {
                          final response = await Openapi().getEmployeeResourceApi().createEmployee(
                            employeeDTO: employeeDTOBuilder.build(),
                            headers: {'Authorization': 'Bearer $jwtToken'},
                          );

                          if (response.statusCode == 201) {
                            setState(() {
                              _isCreatingEmployee = false;
                              _nameController.clear();
                              _positionController.clear();
                              _emailController.clear();
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Employee created successfully!'),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $e')),
                          );
                        } finally {
                          _readMethod();
                        }
                      }
                    },
                    child: Text('Save Employee'),
                  ),
                ],
              ),
            ),
          SizedBox(height: 20),
          _employees.isEmpty
              ? Center(child: Text('No employees found.'))
              : SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Position')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: _employees.map((employee) {
                        return DataRow(
                          cells: [
                            DataCell(Text(employee['id'] ?? 'N/A')),
                            DataCell(Text(employee['name'] ?? 'N/A')),
                            DataCell(Text(employee['position'] ?? 'N/A')),
                            DataCell(Text(employee['email'] ?? 'N/A')),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      _editNameController.text = employee['name'] ?? '';
                                      _editPositionController.text = employee['position'] ?? '';
                                      _editEmailController.text = employee['email'] ?? '';

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Edit Employee'),
                                            content: Form(
                                              key: _formKey,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  TextFormField(
                                                    controller: _editNameController,
                                                    decoration: InputDecoration(labelText: 'Employee Name'),
                                                    validator: Validators.validateName,
                                                  ),
                                                  TextFormField(
                                                    controller: _editPositionController,
                                                    decoration: InputDecoration(labelText: 'Position'),
                                                    validator: (value) => Validators.validateRequired(value, fieldName: 'Position'),
                                                  ),
                                                  TextFormField(
                                                    controller: _editEmailController,
                                                    decoration: InputDecoration(labelText: 'Email'),
                                                    validator: Validators.validateEmail,
                                                    keyboardType: TextInputType.emailAddress,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () async {
                                                  if (_formKey.currentState!.validate()) {
                                                    final employeeDTOBuilder = EmployeeDTOBuilder()
                                                      ..id = int.parse(employee['id']!)
                                                      ..name = _editNameController.text.trim()
                                                      ..position = _editPositionController.text.trim()
                                                      ..email = _editEmailController.text.trim();

                                                    print('Updating employee with ID: ${employee['id']}');
                                                    print('Name: ${_editNameController.text.trim()}');
                                                    print('Position: ${_editPositionController.text.trim()}');
                                                    print('Email: ${_editEmailController.text.trim()}');

                                                    try {
                                                      final response = await Openapi().getEmployeeResourceApi().updateEmployee(
                                                        id: int.parse(employee['id']!),
                                                        employeeDTO: employeeDTOBuilder.build(),
                                                        headers: {'Authorization': 'Bearer $jwtToken'},
                                                      );

                                                      if (response.statusCode == 200) {
                                                        Navigator.of(context).pop();
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text('Employee updated successfully!'),
                                                            backgroundColor: Colors.green,
                                                            duration: Duration(seconds: 2),
                                                          ),
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            content: Text('Failed to update employee. Status code: ${response.statusCode}'),
                                                            backgroundColor: Colors.red,
                                                            duration: Duration(seconds: 2),
                                                          ),
                                                        );
                                                      }
                                                    } catch (e) {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(content: Text('Error updating employee: $e')),
                                                      );
                                                    } finally {
                                                      _readMethod();
                                                    }
                                                  }
                                                },
                                                child: Text('Save Changes'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () async {
                                      try {
                                        final response = await Openapi().getEmployeeResourceApi().deleteEmployee(
                                          id: int.parse(employee['id']!),
                                          headers: {'Authorization': 'Bearer $jwtToken'},
                                        );
                                        if (response.statusCode == 200 || response.statusCode == 204) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Employee deleted successfully!'),
                                              backgroundColor: Colors.red,
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Failed to delete employee!'),
                                              backgroundColor: Colors.amber,
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Error: $e')),
                                        );
                                      } finally {
                                        _readMethod();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
