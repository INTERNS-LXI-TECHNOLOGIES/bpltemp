part of 'company_cubit.dart';

abstract class CompanyState extends Equatable {
  const CompanyState();

  @override
  List<Object> get props => [];
}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final List<Map<String, String>> companies;

  CompanyLoaded(this.companies);

  @override
  List<Object> get props => [companies];
}

class CompanyCreated extends CompanyState {}

class CompanyUpdated extends CompanyState {}

class CompanyDeleted extends CompanyState {}

class CompanyError extends CompanyState {
  final String message;

  CompanyError(this.message);

  @override
  List<Object> get props => [message];
}

class CompanySuccessMessage extends CompanyState{
  final String message;

CompanySuccessMessage(this.message);

  List<Object> get props => [message]; 
}