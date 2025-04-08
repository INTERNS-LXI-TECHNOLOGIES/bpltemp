import 'package:flutter/material.dart';
// Import the generated localization file
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// No longer imports Cubits

// Reverted to StatelessWidget as interaction relied on data from Cubits
class EmployeeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the localizations instance. The '!' assumes setup is correct.
    final l10n = AppLocalizations.of(context)!;

    // Hardcoded data for UI preview
    final List<Map<String, String>> staticCompaniesDropdown = [
      {'id': 'C001', 'name': 'Tech Solutions'},
      {'id': 'C002', 'name': 'Global Health'},
      {'id': 'C003', 'name': 'Finance Hub'},
    ];

    // Only showing one set of employees as dropdown is not interactive without state/data
    final List<Map<String, String>> staticEmployees = [
      {'id': 'E101', 'name': 'Alice Smith', 'position': 'Developer'},
      {'id': 'E102', 'name': 'Bob Johnson', 'position': 'Designer'},
    ];

    // Fixed dropdown value for preview
    String? selectedCompanyPreviewId =
        staticCompaniesDropdown.isNotEmpty
            ? staticCompaniesDropdown[0]['id']
            : null;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // --- Dropdown Section ---
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: l10n.selectCompanyHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            value: selectedCompanyPreviewId, // Fixed value
            isExpanded: true,
            // onChanged does nothing without state management for selection
            onChanged: null, // Disabled or does nothing
            items:
                staticCompaniesDropdown.map<DropdownMenuItem<String>>((
                  company,
                ) {
                  return DropdownMenuItem<String>(
                    value: company['id']!,
                    child: Text(company['name']!),
                  );
                }).toList(),
          ),
          const SizedBox(height: 16),

          // --- DataTable Section ---
          Text(
            l10n.employeeListTitle,
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
                  DataColumn(label: Text(l10n.employeeIdHeader)),
                  DataColumn(label: Text(l10n.employeeNameHeader)),
                  DataColumn(label: Text(l10n.employeePositionHeader)),
                  DataColumn(label: Text(l10n.actionsHeader)),
                ],
                // *** Hardcoded Rows for UI Preview ***
                // Data is static as no Cubit is provided
                rows:
                    staticEmployees.map((employee) {
                      return DataRow(
                        cells: [
                          DataCell(Text(employee['id']!)),
                          DataCell(Text(employee['name']!)),
                          DataCell(Text(employee['position']!)),
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
