import 'package:flutter/material.dart';

class CompanyTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // TODO: dispatch CreateCompanyEvent
            },
            child: Text('Create Company'),
          ),
          Expanded(
            child: DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
              ],
              rows: [
                // TODO: Populate using BLoC stream
              ],
            ),
          ),
        ],
      ),
    );
  }
}
