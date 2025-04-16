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
  String jwtToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0NDg4MDIxOCwiYXV0aCI6IlJPTEVfQURNSU4gUk9MRV9VU0VSIiwiaWF0IjoxNzQ0NzkzODE4fQ.rr4hRG68qdKDpToYroFVKT4s-Ulx98f4qaV_sAN54IX7bn080I-rckgxw4tvVA-qtLXQdjE_1xyYkVyar2Af_Q";

  final List<Map<String, String?>> _employees = [];
  List<CompanyDTO> _companies = [];
  CompanyDTO? _selectedCompany;

  @override
  void initState() {
    super.initState();
    _fetchAllEmployees();
    _fetchCompanies();
  }

  void _fetchAllEmployees() async {
    try {
      final response = await Openapi().getEmployeeResourceApi().getAllEmployees(
        employeeDTO: EmployeeDTOBuilder(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200 && response.data != null) {
        final employeesList = response.data!.toList();

        setState(() {
          _employees.clear();
          for (var employee in employeesList) {
            _employees.add({
              'id': employee.id?.toString(),
              'name': employee.name,
              'position': employee.position,
              'email': employee.email,
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

  void _fetchCompanies() async {
    try {
      final response = await Openapi().getCompanyResourceApi().getAllCompanies(
        companyDTO: CompanyDTOBuilder(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200 && response.data != null) {
        setState(() {
          _companies = response.data!.toList();
        });
        print('Companies fetched successfully!');
      } else {
        print('Failed to fetch companies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching companies: $e');
    }
  }

  void _showEditDialog(Map<String, String?> employee) {
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
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _updateEmployee(employee);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateEmployee(Map<String, String?> employee) async {
    final employeeDTOBuilder = EmployeeDTOBuilder();
    employeeDTOBuilder.id = int.tryParse(employee['id'] ?? '');
    employeeDTOBuilder.name = _editNameController.text.trim();
    employeeDTOBuilder.position = _editPositionController.text.trim();
    employeeDTOBuilder.email = _editEmailController.text.trim();

    try {
      final response = await Openapi().getEmployeeResourceApi().updateEmployee(
        id: int.parse(employee['id'] ?? '0'),
        employeeDTO: employeeDTOBuilder.build(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Employee updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        _fetchAllEmployees();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating employee: $e')),
      );
    }
  }

  Future<void> _createEmployee() async {
    final employeeDTOBuilder = EmployeeDTOBuilder();
    employeeDTOBuilder.name = _nameController.text.trim();
    employeeDTOBuilder.position = _positionController.text.trim();
    employeeDTOBuilder.email = _emailController.text.trim();

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
        _fetchAllEmployees();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Employee created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating employee: $e')),
      );
    }
  }

  Future<void> _deleteEmployee(String? employeeId) async {
    if (employeeId == null) return;

    try {
      final response = await Openapi().getEmployeeResourceApi().deleteEmployee(
        id: int.parse(employeeId),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Employee deleted successfully!'),
            backgroundColor: Colors.red,
          ),
        );
        _fetchAllEmployees();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete employee!'),
            backgroundColor: Colors.amber,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isCreatingEmployee = !_isCreatingEmployee;
              });
            },
            child: Text(_isCreatingEmployee ? 'Cancel' : 'Create Employee'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _fetchAllEmployees,
            child: Text('Fetch All Employees'),
          ),
          if (_isCreatingEmployee)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
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
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _createEmployee,
                      child: Text('Save Employee'),
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(height: 20),
          _employees.isEmpty
              ? Center(child: Text('No employees found.'))
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () => _showEditDialog(employee),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deleteEmployee(employee['id']),
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
      ),
    );
  }

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
}
