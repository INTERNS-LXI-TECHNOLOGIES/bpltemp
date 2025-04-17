// ui/crud/employee_tab.dart
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';


class EmployeeScreen extends StatefulWidget {
  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {

List<CompanyDTO> companies = [];




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
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Location')),
        ],
        rows: companies.map((company) {
          return DataRow(
            cells: [
              DataCell(Text('${company.id}')),
              DataCell(Text('${company.name}')),
              DataCell(Text('${company.location}')),
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
}