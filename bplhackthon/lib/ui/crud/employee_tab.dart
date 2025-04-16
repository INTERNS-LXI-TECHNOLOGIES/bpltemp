// ui/crud/employee_tab.dart
import 'package:flutter/material.dart';

class EmployeeTab extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();

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

        //  ID
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: idController,
            decoration: InputDecoration(
              labelText: 'Employee ID',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ),

        // Name
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Employee Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        //  Position
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: TextField(
            controller: positionController,
            decoration: InputDecoration(
              labelText: 'Position',
              border: OutlineInputBorder(),
            ),
          ),
        ),

        ElevatedButton(
          onPressed: () {
            // TODO: dispatch CreateEmployeeEvent using:

            
          },
          child: Text('Add Employee'),
        ),
        
        Expanded(
          child: ListView(
            children: [
              // TODO: Populate using EmployeeBloc stream
            ],
          ),
        ),
      ],
    );
  }
}
