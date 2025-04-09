import 'package:flutter/material.dart';

class EmployeeTab extends StatefulWidget {
  @override
  _EmployeeTabState createState() => _EmployeeTabState();
}

class _EmployeeTabState extends State<EmployeeTab> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _positionController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isCreatingEmployee = false;

  // Dummy data for demonstration purposes
  final List<Map<String, String>> _employees = [
    {'id': '1', 'name': 'John Doe', 'position': 'Developer', 'email': 'john.doe@example.com'},
    {'id': '2', 'name': 'Jane Smith', 'position': 'Designer', 'email': 'jane.smith@example.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          hint: Text('Select Company'),
          value: null, // TODO: Bind this to selectedCompany
          onChanged: (String? newValue) {
            // TODO: dispatch event to load employees by company
          },
          items: [
            // TODO: Populate from CompanyBloc stream
          ],
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isCreatingEmployee = !_isCreatingEmployee;
            });
          },
          child: Text(_isCreatingEmployee ? 'Cancel' : 'Create Employee'),
        ),
        if (_isCreatingEmployee)
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Employee Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 2) {
                      return 'Please enter a valid employee name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _positionController,
                  decoration: InputDecoration(labelText: 'Position'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a position';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty || !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: dispatch CreateEmployeeEvent with _nameController.text, _positionController.text, and _emailController.text
                      setState(() {
                        _isCreatingEmployee = false;
                        // Add the new employee to the list
                        _employees.add({
                          'id': (_employees.length + 1).toString(),
                          'name': _nameController.text,
                          'position': _positionController.text,
                          'email': _emailController.text,
                        });
                        // Clear the form
                        _nameController.clear();
                        _positionController.clear();
                        _emailController.clear();
                      });
                    }
                  },
                  child: Text('Save Employee'),
                ),
              ],
            ),
          ),
        Expanded(
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
                  DataCell(Text(employee['id']!)),
                  DataCell(Text(employee['name']!)),
                  DataCell(Text(employee['position']!)),
                  DataCell(Text(employee['email']!)),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            // TODO: Handle read action
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // TODO: Handle update action
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // TODO: Handle delete action
                            setState(() {
                              _employees.remove(employee);
                            });
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
      ],
    );
  }
}
