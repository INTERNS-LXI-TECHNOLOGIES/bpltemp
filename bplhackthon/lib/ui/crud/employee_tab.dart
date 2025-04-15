// ui/crud/employee_tab.dart
import 'package:flutter/material.dart';

class EmployeeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          hint: Text('Select Company'),
          value: null, // TODO: Bind this to selectedCompany
          onChanged: (String? newValue) {
            // TODO: dispatch event to load employees by company
          },
          items: [
            // TODO: Populate from CompanyBloc stream
          ],
        ),
        Expanded(
          child: DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Position')),
            ],
            rows: [
              // TODO: Populate using EmployeeBloc stream
            ],
          ),
        ),
      ],
    );
  }
}