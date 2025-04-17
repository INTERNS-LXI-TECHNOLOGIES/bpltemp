import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:openapi/openapi.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());

  final String jwtToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTc0NDk3MDg4MSwiYXV0aCI6IlJPTEVfQURNSU4gUk9MRV9VU0VSIiwiaWF0IjoxNzQ0ODg0NDgxfQ.5SqtrAU3K86PHVa0W9jvqpxmcxo6VVl6ri9eWa-kv663saeL6-eo0t6U-OJI7W7kUTSY13_maZjJmqRakFL5jw";

  void fetchCompanies() async {
    emit(CompanyLoading());
    try {
      final response = await Openapi().getCompanyResourceApi().getAllCompanies(companyDTO: CompanyDTOBuilder(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200 && response.data != null) {
        final companiesList = response.data!.toList();
        final companies = companiesList.map((company) {
          return {
            'id': company.id?.toString() ?? '',
            'name': company.name ?? '',
            'location': company.location ?? '',
          };
        }).toList();

        emit(CompanyLoaded(companies));
      } else {
        emit(CompanyError('Failed to fetch companies. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CompanyError('Error occurred while fetching companies: $e'));
    }
  }

  void createCompany(String name, String location) async {
    final companyDTOBuilder = CompanyDTOBuilder()
      ..name = name
      ..location = location;

    try {
      final response = await Openapi().getCompanyResourceApi().createCompany(
        companyDTO: companyDTOBuilder.build(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );
      if (response.statusCode == 201) {
        fetchCompanies();
        emit(CompanyCreated());
        emit(CompanySuccessMessage('Company Created Successfully !'));
      } else {
        emit(CompanyError('Failed to create company. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CompanyError('Error creating company: $e'));
    }
  }

  void updateCompany(String id, String name, String location) async {
    final companyDTOBuilder = CompanyDTOBuilder()
      ..id = int.parse(id)
      ..name = name
      ..location = location;

    try {
      final response = await Openapi().getCompanyResourceApi().updateCompany(
        id: int.parse(id),
        companyDTO: companyDTOBuilder.build(),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );
      if (response.statusCode == 200) {
        fetchCompanies();
        emit(CompanyUpdated());
        emit(CompanySuccessMessage('updated Company details of $id'));
      } else {
        emit(CompanyError('Failed to update company. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CompanyError('Error updating company: $e'));
    }
  }

  void deleteCompany(String id) async {
    try {
      final response = await Openapi().getCompanyResourceApi().deleteCompany(
        id: int.parse(id),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );
      if (response.statusCode == 200 || response.statusCode == 204) {
        fetchCompanies();
        emit(CompanyDeleted());
        emit(CompanySuccessMessage('Company $id deleted successfully'));
      } else {
        emit(CompanyError('Failed to delete company. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CompanyError('Error deleting company: $e'));
    }
  }
}
