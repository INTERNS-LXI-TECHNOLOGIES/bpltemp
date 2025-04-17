import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon/bloc/company_cubit.dart';
import 'package:hackathon/validation/validators.dart';

class CompanyTab extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _editNameController = TextEditingController();
  final _editLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if (state is CompanyError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is CompanySuccessMessage) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.green,duration: Duration(seconds: 2),),
          );
        }
        else if (state is CompanyCreated || state is CompanyUpdated || state is CompanyDeleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Operation successful!'), backgroundColor: Colors.green,duration: Duration(seconds: 1),),
          );
        }
      },
      child: BlocBuilder<CompanyCubit, CompanyState>(
        builder: (context, state) {
          if (state is CompanyLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CompanyLoaded) {
            return _buildCompanyList(context, state.companies);
          } else {
            return _buildInitialUI(context);
          }
        },
      ),
    );
  }

  Widget _buildInitialUI(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<CompanyCubit>().fetchCompanies();
            },
            child: Text('Fetch Companies'),
          ),
          ElevatedButton(
            onPressed: () {
              _showCreateCompanyDialog(context);
            },
            child: Text('Create Company'),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyList(BuildContext context, List<Map<String, String>> companies) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            _showCreateCompanyDialog(context);
          },
          child: Text('Create Company'),
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
                rows: companies.map((company) {
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
                                _showEditCompanyDialog(context, company);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                context.read<CompanyCubit>().deleteCompany(company['id']!);
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
    );
  }

  void _showCreateCompanyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create Company'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<CompanyCubit>().createCompany(
                    _nameController.text,
                    _locationController.text,
                  );
                  Navigator.pop(context);
                  _nameController.clear();
                  _locationController.clear();
                }
              },
              child: Text('Save Company'),
            ),
          ],
        );
      },
    );
  }

  void _showEditCompanyDialog(BuildContext context, Map<String, String> company) {
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
              onPressed: () {
                context.read<CompanyCubit>().updateCompany(
                  company['id']!,
                  _editNameController.text,
                  _editLocationController.text,
                );
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
