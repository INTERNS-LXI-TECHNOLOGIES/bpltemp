import 'package:flutter/material.dart';



class OrganizationForm extends StatefulWidget {

  @override
  _OrganizationFormState createState() => _OrganizationFormState();

}


class _OrganizationFormState extends State<OrganizationForm> {
  
  final InputDecoration fieldDecoration = InputDecoration(
    
    border: OutlineInputBorder(),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

  );

  String? selectedOrgType;
  String? selectedOrgGroup;
  String? selectedParentOrg;

  final List<String> orgTypes = [];
  final List<String> orgGroups = [];
  final List<String> parentOrgs = [];


  Widget buildFormField(String label) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4),
        TextField(decoration: fieldDecoration),
      ],
    );
  }


  Widget buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,}) {
      
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(height: 4),
         
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),

            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              underline: SizedBox(),
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

    return Scaffold(
      
      backgroundColor: Color(0xFFDEE2FF),
      
      appBar: AppBar(
        title: Text('Organization'),
        backgroundColor: Color(0xFF6C75A1),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 4),
                      ],
                    ),
                    child: Column(
                      children: [
                        buildFormField('ID'),
                        SizedBox(height: 8),
                        buildFormField('External ID'),
                      ],
                    ),
                  ),
                ),
                
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 4),
                      ],
                    ),
                    child: Column(
                      children: [
                        buildFormField('Name'),
                        SizedBox(height: 8),
                        buildFormField('Description'),
                      ],
                    ),
                  ),
                ),
                
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 4),
                      ],
                    ),
                    child: Column(
                      children: [
                        buildDropdownField(
                          label: 'Organization Type',
                          value: selectedOrgType,
                          items: orgTypes,
                          onChanged: (val) => setState(() => selectedOrgType = val),
                        ),
                        SizedBox(height: 8),
                        buildDropdownField(
                          label: 'Organization Group',
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
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 4),
                      ],
                    ),
                    child: Column(
                      children: [
                        buildDropdownField(
                          label: 'Parent Organization',
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
            
            SizedBox(height: 40),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3A5DAE),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3A5DAE),
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
}
