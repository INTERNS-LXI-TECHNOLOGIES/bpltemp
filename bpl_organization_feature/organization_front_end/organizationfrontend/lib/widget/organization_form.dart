import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import '../localization/app_localizations.dart'; // Adjust if in a different folder

class OrganizationForm extends StatefulWidget {
  final void Function(Locale) setLocale;

  const OrganizationForm({Key? key, required this.setLocale}) : super(key: key);

  @override
  _OrganizationFormState createState() => _OrganizationFormState();
}

class _OrganizationFormState extends State<OrganizationForm> {
  final InputDecoration fieldDecoration = const InputDecoration(
    border: OutlineInputBorder(),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  );

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
    } catch (e) {
      print("Error fetching dropdown data: $e");
    }
  }

  Widget localizedField(String key, String? Function()? initialValueGetter) {
    final tr = AppLocalizations.of(context).translate;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr(key)),
        const SizedBox(height: 4),
        TextField(
          decoration: fieldDecoration.copyWith(
            labelText: tr(key),
          ),
          controller: TextEditingController(text: initialValueGetter?.call()),
        ),
      ],
    );
  }

  Widget localizedDropdown({
    required String labelKey,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    final tr = AppLocalizations.of(context).translate;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr(labelKey)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            onChanged: onChanged,
            items: items.map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            )).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context).translate;

    return Scaffold(
      backgroundColor: const Color(0xFFDEE2FF),
      appBar: AppBar(
        title: Text(tr('organization_details')),
        backgroundColor: const Color(0xFF6C75A1),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Locale>(
                icon: const Icon(Icons.language, color: Colors.white),
                onChanged: (Locale? locale) {
                  if (locale != null) {
                    widget.setLocale(locale);
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: Locale('hi'),
                    child: Text('हिन्दी'),
                  ),
                  DropdownMenuItem(
                    value: Locale('ta'),
                    child: Text('தமிழ்'),
                  ),
                  DropdownMenuItem(
                    value: Locale('ml'),
                    child: Text('മലയാളം'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(4),
                    decoration: _boxDecoration(),
                    child: Column(
                      children: [
                        localizedField('id', () => null),
                        const SizedBox(height: 8),
                        localizedField('external_id', () => null),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(4),
                    decoration: _boxDecoration(),
                    child: Column(
                      children: [
                        localizedField('name', () => null),
                        const SizedBox(height: 8),
                        localizedField('description', () => null),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(4),
                    decoration: _boxDecoration(),
                    child: Column(
                      children: [
                        localizedDropdown(
                          labelKey: 'organization_type',
                          value: selectedOrgType,
                          items: orgTypes,
                          onChanged: (val) => setState(() => selectedOrgType = val),
                        ),
                        const SizedBox(height: 8),
                        localizedDropdown(
                          labelKey: 'organization_group',
                          value: selectedOrgGroup,
                          items: orgGroups,
                          onChanged: (val) => setState(() => selectedOrgGroup = val),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(4),
                    decoration: _boxDecoration(),
                    child: Column(
                      children: [
                        localizedDropdown(
                          labelKey: 'parent_organization',
                          value: selectedParentOrg,
                          items: parentOrgs,
                          onChanged: (val) => setState(() => selectedParentOrg = val),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(tr('save')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3A5DAE),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(tr('cancel')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3A5DAE),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4),
        ],
      );
}
