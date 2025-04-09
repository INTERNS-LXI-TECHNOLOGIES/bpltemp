import 'package:flutter/material.dart';
import 'crud/company_tab.dart';
import 'crud/employee_tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CRUD Tabs'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Companies'),
              Tab(text: 'Employees'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CompanyTab(),
            EmployeeTab(),
          ],
        ),
      ),
    );
  }
}
