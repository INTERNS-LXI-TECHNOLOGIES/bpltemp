import 'package:flutter/material.dart';
import 'package:hackathon/validation/validators.dart';
import 'package:openapi/openapi.dart';

class CompanyTab extends StatefulWidget {
  @override
  _CompanyTabState createState() => _CompanyTabState();
}

class _CompanyTabState extends State<CompanyTab> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  bool _isCreatingCompany = false;
  final _editNameController = TextEditingController();
  final _editLocationController = TextEditingController();
  String jwtToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0NDM0ODU5MiwiYXV0aCI6IlJPTEVfQURNSU4gUk9MRV9VU0VSIiwiaWF0IjoxNzQ0MjYyMTkyfQ.PR0IUZKrmJkZZxxlZp6b3A2uV6OdYC2ILre6Bd13TJCw6ykdAFP4XyPGrucjL6OkehZKvbyfDVOxg-gZYaNtNg";

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _editNameController.dispose();
    _editLocationController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> _companies = [];

  void _readMethod() async {
    var companyFetchDTOBuilder = CompanyDTOBuilder()
      ..name = _nameController.text
      ..location = _locationController.text;

    try {
      final response = await Openapi().getCompanyResourceApi().getAllCompanies(
        companyDTO: companyFetchDTOBuilder,
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200 && response.data != null) {
        final companiesList = response.data!.toList();

        setState(() {
          _companies.clear();
          for (var company in companiesList) {
            _companies.add({
              'id': company.id?.toString() ?? '',
              'name': company.name ?? '',
              'location': company.location ?? '',
            });
          }
        });

        print('Companies fetched successfully!');
      } else {
        print('Failed to fetch companies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching companies: $e');
    }
  }

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
          SizedBox(height: 10),
          ElevatedButton(onPressed: _readMethod, child: Text('Fetch Companies')),
          if (_isCreatingCompany)
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Company Name'),
                    validator: Validators.validateName,
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(labelText: 'Location'),
                    validator: (value) => Validators.validateRequired(value, fieldName: 'Location'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final companyDTOBuilder = CompanyDTOBuilder()
                          ..name = _nameController.text
                          ..location = _locationController.text;

                        try {
                          final response = await Openapi().getCompanyResourceApi().createCompany(
                            companyDTO: companyDTOBuilder.build(),
                            headers: {'Authorization': 'Bearer $jwtToken'},
                          );
                          if (response.statusCode == 201) {
                            setState(() {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Company created successfully!'),backgroundColor: Colors.green,duration: Duration(seconds: 2),));
                              _nameController.clear();
                              _locationController.clear();
                            });
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error creating company: $e')),
                          );
                        }
                      }
                    },
                    child: Text('Save Company'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  _editNameController.text = company['name']!;
                                  _editLocationController.text = company['location']!;

                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Edit Company'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              controller: _editNameController,
                                              decoration: InputDecoration(labelText: 'Company Name'),
                                              validator: Validators.validateName,
                                            ),
                                            TextFormField(
                                              controller: _editLocationController,
                                              decoration: InputDecoration(labelText: 'Location'),
                                              validator: (value) => Validators.validateRequired(value, fieldName: 'Location'),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text('Cancel'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              var companyDTOBuilder = CompanyDTOBuilder()
                                                ..id = int.parse(company['id']!)
                                                ..name = _editNameController.text
                                                ..location = _editLocationController.text;

                                              try {
                                                final response = await Openapi().getCompanyResourceApi().updateCompany(
                                                  id: int.parse(company['id']!),
                                                  companyDTO: companyDTOBuilder.build(),
                                                  headers: {'Authorization': 'Bearer $jwtToken'},
                                                );

                                                if (response.statusCode == 200) {
                                                  setState(() {
                                                    final index = _companies.indexWhere((c) => c['id'] == company['id']);
                                                    if (index != -1) {
                                                      _companies[index] = {
                                                        'id': company['id']!,
                                                        'name': _editNameController.text,
                                                        'location': _editLocationController.text,
                                                      };
                                                    }
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text('Company updated successfully!'),
                                                        backgroundColor: Colors.green,
                                                        duration: Duration(seconds: 2),
                                                      ),
                                                    );
                                                  });
                                                } else {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Failed to update company. Status: ${response.statusCode}'),
                                                      backgroundColor: Colors.red,
                                                    ),
                                                  );
                                                }
                                              } catch (e) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text('Error updating company: ${e.toString()}'),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              }
                                            },
                                            child: Text('Save'),
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
                                    final response = await Openapi().getCompanyResourceApi().deleteCompany(id: int.parse(company['id']!),headers: {'Authorization': 'Bearer $jwtToken'});
                                    if(response.statusCode==200 || response.statusCode==204){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Company Deleted Successfully'),backgroundColor: Colors.red,duration: Duration(seconds: 2),));
                                    }
                                  }
                                  catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Error deleting company: $e')),
                                    );
                                  }
                                  setState(() {
                                    _companies.removeWhere((c) => c['id'] == company['id']);
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
            ),
          ),
        ],
      ),
    );
  }
}
