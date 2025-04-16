import 'package:bpl/cubit/company_cubit.dart';
import 'package:bpl/cubit/company_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // To access supportedLocales

class CompanyTab extends StatefulWidget {
  @override
  _CompanyTabState createState() => _CompanyTabState();
}

class _CompanyTabState extends State<CompanyTab> {
  final Openapi _openapi = Openapi();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  List<CompanyDTO> companies = [];

  @override
  void initState() {
    super.initState();

    // Trigger API call when screen loads
    context.read<CompanyCubit>().fetchCompanies();
  }

  Future<void> _deleteCompany(int companyId) async {
  final l10n = AppLocalizations.of(context)!;

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.confirmDeletionTitle),
      content: Text(l10n.confirmDeletionMessage('company')), // changed employee -> company
      actions: [
        TextButton(
          child: Text(l10n.cancelAction),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: Text(l10n.deleteAction),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );

  if (confirmed == true) {
    context.read<CompanyCubit>().deleteCompany(companyId);
  }
}


Future<void> _editCompany(int id, String oldName, String oldLocation) async {
  final l10n = AppLocalizations.of(context)!;

  final nameController = TextEditingController(text: oldName);
  final locationController = TextEditingController(text: oldLocation);

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Edit Company'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: locationController, decoration: InputDecoration(labelText: 'Location')),
        ],
      ),
      actions: [
        TextButton(
          child: Text(l10n.cancelAction),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: Text('Update'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );

  if (confirmed == true) {
    context.read<CompanyCubit>().updateCompany(
      id,
      nameController.text.trim(),
      locationController.text.trim(),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<CompanyCubit, CompanyState>(
      builder: (context, state) {
        if (state is CompanyLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CompanyError) {
          return Center(child: Text(state.message));
        }

        final companies = state is CompanyLoaded ? state.companies : [];

       return Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.companyNameHeader,
        ),
      ),
      TextField(
        controller: _locationController,
        decoration: InputDecoration(
          labelText: '${AppLocalizations.of(context)!.employeePositionLabel} (${AppLocalizations.of(context)!.cancelAction.toLowerCase()})',
        ),
      ),
      const SizedBox(height: 8),
      ElevatedButton(
        onPressed: () {
          final name = _nameController.text.trim();
          final location = _locationController.text.trim();

          if (name.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(AppLocalizations.of(context)!.validationError(AppLocalizations.of(context)!.companyNameHeader)
              )),
            );
            return;
          }

          context.read<CompanyCubit>().createCompany(name: name, location: location);

          _nameController.clear();
          _locationController.clear();
        },
        child: Text(AppLocalizations.of(context)!.createCompanyButton),
      ),
      const SizedBox(height: 16),
      Text(
        AppLocalizations.of(context)!.companiesTab,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(height: 8),
      Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(label: Text(AppLocalizations.of(context)!.companyIdHeader)),
              DataColumn(label: Text(AppLocalizations.of(context)!.companyNameHeader)),
              DataColumn(label: Text(AppLocalizations.of(context)!.employeePositionLabel)),
              DataColumn(label: Text(AppLocalizations.of(context)!.actionsHeader)),
            ],
            rows: companies.map((company) {
              return DataRow(
                cells: [
                  DataCell(Text(company.id.toString())),
                  DataCell(Text(company.name)),
                  DataCell(Text(company.location ?? '')),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                            size: 18,
                          ),
                          onPressed: () {
                            _editCompany(
                              company.id!,
                              company.name,
                              company.location ?? '',
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 18,
                          ),
                          onPressed: () {
                            _deleteCompany(company.id!);
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

      },
    );
  }
}
