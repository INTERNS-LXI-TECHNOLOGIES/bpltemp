import 'package:bloc/bloc.dart';
import 'package:openapi/openapi.dart';
import 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());

  Future<void> fetchCompanies() async {
    try {
      emit(CompanyLoading());

      final response = await Openapi().getCompanyResourceApi().getAllCompanies(
        headers: {'Authorization': 'Bearer ${Openapi.jwt}'},
      );

      final companies = response.data!.toList();
      emit(CompanyLoaded(companies));
    } catch (e) {
      emit(CompanyError('Failed to fetch companies: $e'));
    }
  }
}
