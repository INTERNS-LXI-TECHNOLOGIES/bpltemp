import 'package:bpl/cubit/company_cubit.dart';
import 'package:bpl/cubit/company_state.dart';
import 'package:bpl/cubit/employee_cubit.dart';
import 'package:bpl/cubit/employee_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // To access supportedLocales


class EmployeeTab extends StatefulWidget {
  @override
  _EmployeeTabState createState() => _EmployeeTabState();
}

class _EmployeeTabState extends State<EmployeeTab> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
CompanyDTO? _selectedCompany;

  List<CompanyDTO> companies = [];
 @override
void initState() {
  super.initState();
  context.read<CompanyCubit>().fetchCompanies();
  context.read<EmployeeCubit>().fetchEmployees();
}

  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    _emailController.dispose();
    super.dispose();
  }

 @override
Widget build(BuildContext context) {
  return MultiBlocListener(
    listeners: [
      BlocListener<CompanyCubit, CompanyState>(
        listener: (context, state) {
          if (state is CompanyError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
      ),
      BlocListener<EmployeeCubit, EmployeeState>(
        listener: (context, state) {
          if (state is EmployeeDeleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppLocalizations.of(context)!.deleteSuccess(AppLocalizations.of(context)!.employeesTab))),
            );
          } else if (state is EmployeeLoaded) {
            _nameController.clear();
            _positionController.clear();
            _emailController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppLocalizations.of(context)!.createSuccess(AppLocalizations.of(context)!.employeesTab))),
            );
          } else if (state is EmployeeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
      ),
    ],
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Company Dropdown
          BlocBuilder<CompanyCubit, CompanyState>(
            builder: (context, state) {
              if (state is CompanyLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CompanyLoaded) {
                return DropdownButtonFormField<CompanyDTO>(
                  value: _selectedCompany,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.selectCompanyPrompt,
                    border: const OutlineInputBorder(),
                  ),
                  items: state.companies.map((company) {
                    return DropdownMenuItem<CompanyDTO>(
                      value: company,
                      child: Text(company.name ?? 'Unknown Company'),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCompany = value;
                    });
                  },
                );
              } else if (state is CompanyError) {
                return Text(state.message);
              }
              return const SizedBox();
            },
          ),

          const SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.createEmployeeTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.employeeNameLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _positionController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.employeePositionLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.employeeEmailLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.isEmpty ||
                  _positionController.text.isEmpty ||
                  _emailController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context)!.validationError(AppLocalizations.of(context)!.employeeNameLabel),
                    ),
                  ),
                );
                return;
              }

              if (_selectedCompany == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(AppLocalizations.of(context)!.pleaseSelectCompany),
                  ),
                );
                return;
              }

              context.read<EmployeeCubit>().createEmployeeWithNewCompany(
                employeeName: _nameController.text,
                position: _positionController.text,
                email: _emailController.text,
                companyId: _selectedCompany!.id,
              );
            },
            child: Text(AppLocalizations.of(context)!.createEmployeeButton),
          ),

          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<EmployeeCubit>().fetchEmployees(),
          ),
          Text(
            AppLocalizations.of(context)!.employeeListTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<EmployeeCubit, EmployeeState>(
              builder: (context, state) {
                if (state is EmployeeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is EmployeeLoaded) {
                  if (state.employees.isEmpty) {
                    return Center(child: Text(AppLocalizations.of(context)!.noEmployeesFound));
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Position')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Company')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: state.employees.map((employee) {
                        return DataRow(
                          cells: [
                            DataCell(Text(employee.id?.toString() ?? 'N/A')),
                            DataCell(Text(employee.name ?? 'N/A')),
                            DataCell(Text(employee.position ?? '-')),
                            DataCell(Text(employee.email ?? '-')),
                            DataCell(Text(employee.company?.name ?? 'N/A')),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () => _editEmployee(employee),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    onPressed: () => employee.id != null 
                                        ? _deleteEmployee(employee.id!)
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                } else if (state is EmployeeError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    ),
  );
}

  void _editEmployee(EmployeeDTO employee) {
    // Implement edit functionality
  }

  Future<void> _deleteEmployee(int employeeId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this employee?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      context.read<EmployeeCubit>().deleteEmployee(employeeId);
    }
  }
}
