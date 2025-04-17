import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon/bloc/employee_bloc.dart';
import 'package:hackathon/bloc/employee_event.dart';
import 'package:hackathon/bloc/employee_state.dart';
import 'package:hackathon/validation/validators.dart';
import 'package:openapi/openapi.dart';

class EmployeeTab extends StatelessWidget {
  final String jwtToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0NDk3MDg4MSwiYXV0aCI6IlJPTEVfQURNSU4gUk9MRV9VU0VSIiwiaWF0IjoxNzQ0ODg0NDgxfQ.5SqtrAU3K86PHVa0W9jvqpxmcxo6VVl6ri9eWa-kv663saeL6-eo0t6U-OJI7W7kUTSY13_maZjJmqRakFL5jw";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeBloc(jwtToken)..add(FetchEmployees()),
      child: EmployeeTabView(),
    );
  }
}

class EmployeeTabView extends StatefulWidget {
  @override
  _EmployeeTabViewState createState() => _EmployeeTabViewState();
}

class _EmployeeTabViewState extends State<EmployeeTabView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _positionController = TextEditingController();
  final _emailController = TextEditingController();
  final _editNameController = TextEditingController();
  final _editPositionController = TextEditingController();
  final _editEmailController = TextEditingController();

  bool _isCreatingEmployee = false;

  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    _emailController.dispose();
    _editNameController.dispose();
    _editPositionController.dispose();
    _editEmailController.dispose();
    super.dispose();
  }

  void _showEditDialog(BuildContext context, EmployeeDTO employee) {
    _editNameController.text = employee.name ?? '';
    _editPositionController.text = employee.position ?? '';
    _editEmailController.text = employee.email ?? '';

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
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final updatedEmployee = EmployeeDTOBuilder()
                    ..id = employee.id
                    ..name = _editNameController.text.trim()
                    ..position = _editPositionController.text.trim()
                    ..email = _editEmailController.text.trim()
                    ..build(); // Ensure build() is called
                  context.read<EmployeeBloc>().add(UpdateEmployee(updatedEmployee.build()));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create Employee'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newEmployee = EmployeeDTOBuilder()
                    ..name = _nameController.text.trim()
                    ..position = _positionController.text.trim()
                    ..email = _emailController.text.trim();
                  context.read<EmployeeBloc>().add(CreateEmployee(newEmployee.build())); // Ensure build() is called
                  Navigator.of(context).pop();
                  setState(() {
                    _isCreatingEmployee = false;
                    _nameController.clear();
                    _positionController.clear();
                    _emailController.clear();
                  });
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _showCreateDialog(context);
            },
            child: Text('Create Employee'),
          ),
          SizedBox(height: 10),
          BlocListener<EmployeeBloc, EmployeeState>(
            listener: (context, state) {
              if (state is EmployeeLoadFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to load employees')),
                );
              }
            },
            child: BlocBuilder<EmployeeBloc, EmployeeState>(
              builder: (context, state) {
                if (state is EmployeeLoadInProgress) {
                  return CircularProgressIndicator();
                } else if (state is EmployeeLoadSuccess) {
                  final employees = state.employees;
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      if (employees.isEmpty)
                        Center(child: Text('No employees found.'))
                      else
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: [
                              DataColumn(label: Text('ID')),
                              DataColumn(label: Text('Name')),
                              DataColumn(label: Text('Position')),
                              DataColumn(label: Text('Email')),
                              DataColumn(label: Text('Actions')),
                            ],
                            rows: employees.map((employee) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(employee.id?.toString() ?? 'N/A')),
                                  DataCell(Text(employee.name ?? 'N/A')),
                                  DataCell(Text(employee.position ?? 'N/A')),
                                  DataCell(Text(employee.email ?? 'N/A')),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.edit, color: Colors.blue),
                                          onPressed: () => _showEditDialog(context, employee),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete, color: Colors.red),
                                          onPressed: () => context.read<EmployeeBloc>().add(DeleteEmployee(employee.id.toString())),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  );
                } else {
                  return Center(child: Text('No employees found.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
