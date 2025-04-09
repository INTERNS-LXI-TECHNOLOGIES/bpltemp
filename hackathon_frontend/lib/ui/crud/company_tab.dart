import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:openapi/openapi.dart';

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
    fetchCompanies();
  }

  Future<void> fetchCompanies() async {
  final response = await _openapi.getCompanyResourceApi().getAllCompanies(
    headers: {
      'Authorization': 'Bearer ${Openapi.jwt}',
    },
  );

  if (response.statusCode == 200||response.statusCode ==201||response.statusCode ==204) {
    setState(() {
      companies = response.data?.toList() ?? [];
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to fetch companies')),
    );
  }
}


  Future<void> createCompany() async {
    final name = _nameController.text.trim();
    final location = _locationController.text.trim();

    if (name.isEmpty) return;

    final companyBuilder =
        CompanyDTOBuilder()
          ..name = name
          ..location = location;

    final response = await _openapi.getCompanyResourceApi().createCompany(
      companyDTO: companyBuilder.build(),
      headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
    );

    if (response.data != null) {
      _nameController.clear();
      _locationController.clear();

      await fetchCompanies(); // Wait to ensure data is loaded properly

      setState(() {}); // Trigger UI rebuild

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Company Created Successfully')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to create company')));
    }
  }

  Future<void> deleteCompany(int id) async {
    final response = await _openapi.getCompanyResourceApi().deleteCompany(
      id: 0,
    );

    if (response.statusCode == 204) {
      fetchCompanies();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Company Deleted')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to delete')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Company Name'),
          ),
          TextField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'Location (optional)'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: createCompany,
            child: Text('Create Company'),
          ),
          const SizedBox(height: 16),
          Text('Company List', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Location')),
                  DataColumn(label: Text('Actions')),
                ],
                rows:
                    companies.map((company) {
                      return DataRow(
                        cells: [
                          DataCell(Text(company.id.toString())),
                          DataCell(Text(company.name)),
                          DataCell(Text(company.location ?? '')),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    // Optional: implement edit logic
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    deleteCompany(company.id!);
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
