import 'package:bpl/cubit/company_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openapi/openapi.dart';

class CompanyCubit extends Cubit<CompanyState> {
  final Openapi _openapi = Openapi(); // Initialize OpenAPI client

  CompanyCubit(Openapi openapi) : super(CompanyInitial()); // Initial state

  // Method to fetch companies from the API

  Future<void> fetchCompanies() async {
    // Emit loading state
    emit(CompanyLoading());
    try {
      // Initialize OpenAPI client
      final response = await _openapi.getCompanyResourceApi().getAllCompanies(
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );

      // Check if response has data
      if (response.data != null) {
        emit(CompanyLoaded(response.data!.toList())); // Emit loaded state
      } else {
        emit(CompanyError("No data found")); // Emit error if data null
      }
    } catch (e) {
      emit(CompanyError(e.toString())); // Emit error state on exception
    }
  }

  Future<void> createCompany(
      {required String name, required String location}) async {
    if (name.isEmpty) return;

    try {
      emit(CompanyLoading());
      final companyBuilder = CompanyDTOBuilder()
        ..name = name
        ..location = location;

      final response = await _openapi.getCompanyResourceApi().createCompany(
        companyDTO: companyBuilder.build(),
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );

      if (response.data != null) {
        await fetchCompanies();
      } else {
        emit(CompanyError('Failed to create company'));
      }
    } catch (e) {
      emit(CompanyError(e.toString()));
    }
  }

  Future<void> deleteCompany(int id) async {
  try {
    final response = await _openapi.getCompanyResourceApi().deleteCompany(
      id: id,
      headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      emit(CompanySuccess('Company deleted successfully'));
      fetchCompanies();
    } else {
      emit(CompanyError('Failed to delete company'));
    }
  } catch (e) {
    emit(CompanyError('Something went wrong'));
  }
}


Future<void> updateCompany(int id, String name, String location) async {
  try {
    final companyBuilder = CompanyDTOBuilder()
      ..id = id
      ..name = name
      ..location = location;

    final response = await _openapi.getCompanyResourceApi().updateCompany(
      id: id,
      companyDTO: companyBuilder.build(),
      headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
    );

    if (response.statusCode == 200) {
      emit(CompanySuccess('Company updated successfully'));
      fetchCompanies();
    } else {
      emit(CompanyError('Failed to update company (Status: ${response.statusCode})'));
    }
  } catch (e) {
    emit(CompanyError('Failed to update company'));
  }
}

  

}


