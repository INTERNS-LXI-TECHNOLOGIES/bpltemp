import 'package:openapi/openapi.dart';

abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final List<CompanyDTO> companies;
  CompanyLoaded(this.companies);
}

class CompanyError extends CompanyState {
  final String message;
  CompanyError(this.message);
}
