// ui/crud/company_tab.dart
import 'package:flutter/material.dart';

class CompanyTab extends StatelessWidget {
  
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
         
          //  ID
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'Company ID',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        
          //  Name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Company Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              // TODO: dispatch CreateCompanyEvent using:
             
            },
            child: Text('Create Company'),
          ),

          Expanded(
            child: ListView(
              children: [
                // TODO: Populate using BLoC stream
              ],
            ),
          ),
        ],
      ),
    );
  }
}
