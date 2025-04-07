import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
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

  List<String> orgTypes = [];
  List<String> orgGroups = [];
  List<String> parentOrgs = [];

  @override
  void initState() {
    super.initState();
    fetchDropdownData();
  }

  Future<void> fetchDropdownData() async {
    final api = Openapi();
    try {
      final orgTypeResponse = await api.getOrganizationResourceApi().getAllOrganizations();
      final orgGroupResponse = await api.getOrganizationResourceApi().getAllOrganizations();
      final parentOrgResponse = await api.getOrganizationResourceApi().getAllOrganizations();
      
      setState(() {
        orgTypes = orgTypeResponse.data?.map((e) => e.name).whereType<String>().toList() ?? [];
        orgGroups = orgGroupResponse.data?.map((e) => e.name).whereType<String>().toList() ?? [];
        parentOrgs = parentOrgResponse.data?.map((e) => e.name).whereType<String>().toList() ?? [];
      });
    } 
    
    catch (e) {
      print("Error fetching dropdown data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localization!.translate('title')),
        actions: [_buildLanguageDropdown()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          children: [
            Text(localization.translate('organization_details'),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _buildTextField(idController, localization.translate('id')),
            _buildTextField(externalIdController, localization.translate('external_id')),
            _buildTextField(nameController, localization.translate('name')),
            _buildTextField(descriptionController, localization.translate('description')),
            _buildDropdownField(localization.translate('organization_type'), selectedOrgType, orgTypes, (value) {
              setState(() {
                selectedOrgType = value;
              });
            }),
            _buildDropdownField(localization.translate('organization_group'), selectedOrgGroup, orgGroups, (value) {
              setState(() {
                selectedOrgGroup = value;
              });
            }),
            _buildDropdownField(localization.translate('parent_organization'), selectedParentOrg, parentOrgs, (value) {
              setState(() {
                selectedParentOrg = value;
              });
            }),
            SizedBox(height: 20),
            _buildSaveCancelButtons(localization)
          ],
        ),
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

  Widget _buildDropdownField(String label, String? value, List<String> items, Function(String?) onChanged) {
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

  Widget _buildLanguageDropdown() {
    return DropdownButton<Locale>(
      value: _selectedLocale,
      icon: Icon(Icons.language, color: Colors.white),
      items: [
        DropdownMenuItem(value: Locale('en'), child: Text("English")),
        DropdownMenuItem(value: Locale('hi'), child: Text("हिन्दी")),
        DropdownMenuItem(value: Locale('ta'), child: Text("தமிழ்")),
        DropdownMenuItem(value: Locale('ml'), child: Text("മലയാളം")),
      ],
      onChanged: (locale) {
        if (locale != null) {
          setState(() {
            _selectedLocale = locale;
            widget.setLocale(locale);
          });
        }
      },
    );
  }

  Widget _buildSaveCancelButtons(AppLocalizations localization) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _saveData,
          child: Text(localization.translate('save')),
        ),
        SizedBox(width: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text(localization.translate('cancel')),
        ),
      ],
    );
  }

  Future<void> _saveData() async {
    
    final api = Openapi();
    if (!_validateInput()) return;

    final organization = OrganizationBuilder()
      ..id = int.parse(idController.text)
      ..externalId = externalIdController.text
      ..name = nameController.text
      ..description = descriptionController.text;
     // ..organizationType = selectedOrgType
     // ..organizationGroup = selectedOrgGroup;

    try {
      final response = await api.getOrganizationResourceApi().createOrganization(
        organization: organization.build(),
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );
      print(response.statusCode == 201 ? "Success" : "Error: ${response.statusCode}");
    } catch (e) {
      print("Error: $e");
    }
  }

  bool _validateInput() {
    return [idController, externalIdController, nameController, descriptionController]
        .every((controller) => controller.text.isNotEmpty) && selectedOrgType != null;
  }
}