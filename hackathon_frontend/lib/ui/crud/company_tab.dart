import 'package:flutter/material.dart';
// Import the generated localization file
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// No longer imports CompanyCubit

class CompanyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the localizations instance. The '!' assumes setup is correct.
    final l10n = AppLocalizations.of(context)!;

    // Hardcoded data for UI preview
    final List<Map<String, String>> staticCompanies = [
      {'id': 'C001', 'name': 'Tech Solutions'},
      {'id': 'C002', 'name': 'Global Health'},
      {'id': 'C003', 'name': 'Finance Hub'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {
              // TODO: Implement create company logic (e.g., show dialog)
              // This button press does not depend on Cubit/Bloc
              print("Create Company button pressed (UI only)");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.createActionPending),
                ), // Localized message
              );
            },
            // Use localized string
            child: Text(l10n.createCompanyButton),
          ),
          const SizedBox(height: 16),

          // --- DataTable Section ---
          Text(
            l10n.companyListTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Colors.blueGrey.shade100,
                ),
                columns: [
                  DataColumn(label: Text(l10n.companyIdHeader)),
                  DataColumn(label: Text(l10n.companyNameHeader)),
                  DataColumn(label: Text(l10n.actionsHeader)),
                ],
                // *** Hardcoded Rows for UI Preview ***
                // Data is static as no Cubit is provided
                rows:
                    staticCompanies.map((company) {
                      return DataRow(
                        cells: [
                          DataCell(Text(company['id']!)),
                          DataCell(Text(company['name']!)),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    size: 18,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {},
                                  tooltip: l10n.editActionTooltip,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    size: 18,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {},
                                  tooltip: l10n.deleteActionTooltip,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                // *** End Hardcoded Rows ***
              ),
            ),
          ),
        ],
      ),
    );
  }
}
