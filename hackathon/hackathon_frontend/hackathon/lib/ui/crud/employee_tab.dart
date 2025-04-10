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
  bool _isCreatingEmployee = false;

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
                      String jwtToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0NDM0ODU5MiwiYXV0aCI6IlJPTEVfQURNSU4gUk9MRV9VU0VSIiwiaWF0IjoxNzQ0MjYyMTkyfQ.PR0IUZKrmJkZZxxlZp6b3A2uV6OdYC2ILre6Bd13TJCw6ykdAFP4XyPGrucjL6OkehZKvbyfDVOxg-gZYaNtNg";
                      final employeeDTOBuilder = EmployeeDTOBuilder()
                        ..name = _nameController.text.trim()
                        ..position = _positionController.text.trim()
                        ..email = _emailController.text.trim();

                      try {
                        final response = await Openapi().getEmployeeResourceApi().createEmployee(
                          employeeDTO: employeeDTOBuilder.build(),
                          headers: {'Authorization': 'Bearer $jwtToken'},
                        );

                        if (response.statusCode == 200) {
                          setState(() {
                            _isCreatingEmployee = false;
                            _nameController.clear();
                            _positionController.clear();
                            _emailController.clear();
                          });
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $e')),
                        );
                      }
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
                        IconButton(icon: Icon(Icons.visibility), onPressed: () {}),
                        IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                        IconButton(icon: Icon(Icons.delete), onPressed: () {}),
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