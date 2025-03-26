import 'package:flutter/material.dart';

class TelephonePage extends StatefulWidget {
  @override
  _TelephonePageState createState() => _TelephonePageState();
}

class _TelephonePageState extends State<TelephonePage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController areaCodeController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController connectPersonController = TextEditingController();

  String selectedCountryCode = '+1';
  List<String> countryCodes = ['+1', '+91', '+44', '+81', '+61'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telephone Page", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInputField(idController, 'Create ID', Icons.perm_identity),
              SizedBox(height: 10),
              Row(
                children: [
                  DropdownButton<String>(
                    value: selectedCountryCode,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountryCode = newValue!;
                      });
                    },
                    items: countryCodes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(fontSize: 16)),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: buildInputField(areaCodeController, 'Area Code', Icons.location_on, isNumber: true),
                  ),
                ],
              ),
              SizedBox(height: 10),
              buildInputField(contactController, 'Contact Number', Icons.phone, isNumber: true),
              SizedBox(height: 10),
              buildInputField(nameController, 'Name', Icons.person),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: buildInputField(connectPersonController, 'Connect a Person', Icons.group),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, size: 28, color: Colors.blueAccent),
                    onPressed: () {
                      // Implement search functionality here
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle form submission here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text('Submit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(TextEditingController controller, String label, IconData icon, {bool isNumber = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueAccent),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    );
  }
}
