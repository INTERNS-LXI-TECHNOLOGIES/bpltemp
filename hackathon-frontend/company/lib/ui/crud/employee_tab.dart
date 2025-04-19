import 'package:company/cubit/company_cubit.dart';
import 'package:company/cubit/company_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EmployeeScreen extends StatefulWidget {
  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  String? selectedCompany;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Companies")),
      body: BlocBuilder<CompanyCubit, CompanyState>(
        builder: (context, state) {
          if (state is CompanyLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CompanyLoaded) {
            final companies = state.companies;

            return Column(
              children: [
                DropdownButton<String>(
                  hint: Text('Select Company'),
                  value: selectedCompany,
                  items: companies.map((company) {
                    return DropdownMenuItem<String>(
                      value: company.name,
                      child: Text(company.name ?? ''),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCompany = value;
                    });
                  },
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
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
                )
              ],
            );
          } else if (state is CompanyError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text("No data"));
          }
        },
      ),
    );
  }
}
