import 'package:flutter/material.dart';

class CompanyTab extends StatefulWidget {
  @override
  _CompanyTabState createState() => _CompanyTabState();
}

class _CompanyTabState extends State<CompanyTab> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  bool _isCreatingCompany = false;

  // Dummy data for demonstration purposes
  final List<Map<String, String>> _companies = [
    {'id': '1', 'name': 'Company A', 'location': 'Location A'},
    {'id': '2', 'name': 'Company B', 'location': 'Location B'},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isCreatingCompany = !_isCreatingCompany;
              });
            },
            child: Text(_isCreatingCompany ? 'Cancel' : 'Create Company'),
          ),
          if (_isCreatingCompany)
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Company Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 2) {
                        return 'Please enter a valid company name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(labelText: 'Location'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // TODO: dispatch CreateCompanyEvent with _nameController.text and _locationController.text
                        setState(() {
                          _isCreatingCompany = false;
                          // Add the new company to the list
                          _companies.add({
                            'id': (_companies.length + 1).toString(),
                            'name': _nameController.text,
                            'location': _locationController.text,
                          });
                          // Clear the form
                          _nameController.clear();
                          _locationController.clear();
                        });
                      }
                    },
                    child: Text('Save Company'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Actions')),
              ],
              rows: _companies.map((company) {
                return DataRow(
                  cells: [
                    DataCell(Text(company['id']!)),
                    DataCell(Text(company['name']!)),
                    DataCell(Text(company['location']!)),
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
                                _companies.remove(company);
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
      ),
    );
  }
}
