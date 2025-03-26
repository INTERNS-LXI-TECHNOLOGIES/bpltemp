import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

void main() {
  runApp(LogisticsApp());
}

class LogisticsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogisticsDashboard(),
    );
  }
}

class LogisticsDashboard extends StatefulWidget {
  @override
  _LogisticsDashboardState createState() => _LogisticsDashboardState();
  
}

class _LogisticsDashboardState extends State<LogisticsDashboard> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController externalIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  
Openapi openapi = Openapi();
  String? selectedOrgType;
  String? selectedOrgGroup;
  String? selectedParentOrg;

  List<String> orgTypes = ['Type A', 'Type B', 'Type C'];
  List<String> orgGroups = ['Group X', 'Group Y', 'Group Z'];
  List<String> parentOrgs = ['Parent 1', 'Parent 2', 'Parent 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BPL Cargo Logistics Dashboard'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Organization Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildTextField(idController, 'ID'),
                      _buildTextField(externalIdController, 'External ID'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      _buildTextField(nameController, 'Name'),
                      _buildTextField(descriptionController, 'Description'),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      _buildDropdown('Organization Type', selectedOrgType, orgTypes, (value) {
                        setState(() {
                          selectedOrgType = value;
                        });
                      }),
                      _buildDropdown('Organization Group', selectedOrgGroup, orgGroups, (value) {
                        setState(() {
                          selectedOrgGroup = value;
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildDropdown('Parent Organization', selectedParentOrg, parentOrgs, (value) {
                    setState(() {
                      selectedParentOrg = value;
                    });
                  }),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: value,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
