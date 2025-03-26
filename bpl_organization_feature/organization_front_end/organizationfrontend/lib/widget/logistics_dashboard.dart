import 'package:flutter/material.dart';
import 'package:organizationfrontend/localization/app_localizations.dart';




class LogisticsDashboard extends StatefulWidget {

  final Function(Locale) setLocale;
  LogisticsDashboard({required this.setLocale});


  @override
  _LogisticsDashboardState createState() => _LogisticsDashboardState();

}



class _LogisticsDashboardState extends State<LogisticsDashboard> {

  final TextEditingController idController = TextEditingController();
  final TextEditingController externalIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Locale _selectedLocale = Locale('en'); 

  String? selectedOrgType;
  String? selectedOrgGroup;
  String? selectedParentOrg;

  List<String> orgTypes = ['Type A', 'Type B', 'Type C'];
  List<String> orgGroups = ['Group X', 'Group Y', 'Group Z'];
  List<String> parentOrgs = ['Parent 1', 'Parent 2', 'Parent 3'];



  void _changeLanguage(Locale locale) {
    setState(() {
      _selectedLocale = locale;
      widget.setLocale(locale);  
    });
  }



  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization!.translate('title')),
        backgroundColor: Colors.blue[900],
        actions: [
          DropdownButton<Locale>(
            value: _selectedLocale,
            icon: Icon(Icons.language, color: Colors.white),
            dropdownColor: Colors.blue[900],
            items: [
              DropdownMenuItem(value: Locale('en'), child: Text("English")),
              DropdownMenuItem(value: Locale('hi'), child: Text("हिन्दी")),
              DropdownMenuItem(value: Locale('ta'), child: Text("தமிழ்")),
              DropdownMenuItem(value: Locale('ml'), child: Text("മലയാളം")),
            ],
            onChanged: (locale) {
              if (locale != null) {
                _changeLanguage(locale);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(localization.translate('organization_details'),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildTextField(idController, localization.translate('id')),
                      _buildTextField(externalIdController, localization.translate('external_id')),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      _buildTextField(nameController, localization.translate('name')),
                      _buildTextField(descriptionController, localization.translate('description')),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      _buildDropdown(localization.translate('organization_type'), selectedOrgType, orgTypes, (value) {
                        setState(() {
                          selectedOrgType = value;
                        });
                      }),
                      _buildDropdown(localization.translate('organization_group'), selectedOrgGroup, orgGroups, (value) {
                        setState(() {
                          selectedOrgGroup = value;
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _buildDropdown(localization.translate('parent_organization'), selectedParentOrg, parentOrgs, (value) {
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
                  onPressed: () {


                  },
                  child: Text(localization.translate('save')),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text(localization.translate('cancel')),
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