// ui/crud/company_tab.dart
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState  extends State<CompanyScreen> {

   final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

final Openapi api = Openapi();
List<CompanyDTO> companies = []; // This should be populated from the API


Future<void>fetchCompany()async{

             try{

            final response = await api.getCompanyResourceApi().getAllCompanies(
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );

if (response.data != null) {
        setState(() {
          companies = response.data!.toList(); // 👈 update the state
        });
        print("Successfully fetched");
      }


             }catch(e){
           
                 e.toString();
             }

}

 void initState() {
    super.initState();
    fetchCompany();
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
           TextField(
              controller: _companyNameController,
              decoration: InputDecoration(labelText: 'Company Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
          ElevatedButton(
            onPressed: () {
               final  dto =CompanyDTOBuilder()
                      ..name = _companyNameController.text
                      ..location = _locationController.text
                      ..build();
                      try{
                        if(dto.name == null || dto.location == null){
                          print('Company name or location is null');
                          return;
                        }
                 final response = api.getCompanyResourceApi().createCompany(
                      companyDTO: dto.build(),
                        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
                        
                      
                    
                 );
                 
                  print('successfully created company: ${response}'); // TODO: handle response
                 
// stat       
                      }catch (e) {
                        print('Error creating company: $e');
                      }


             // CompanyResourceApi companyResourceApi = getCompanyResourceApi();
              String companyName = _companyNameController.text;
              String location = _locationController.text;
              if (companyName.isEmpty || location.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill in all fields')),
                );
                return;
              }

              // TODO: dispatch CreateCompanyEvent
            },
       child: Text('Create Company'),
),

Expanded(
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Location')),
        ],
        rows: companies.map((company) {
          return DataRow(
            cells: [
              DataCell(Text('${company.id}')),
              DataCell(Text('${company.name}')),
              DataCell(Text('${company.location}')),
            ],
          );
        }).toList(),
      ),
    ),
  ),
),

        ],
      ),
    );
  }
}
