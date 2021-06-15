part of 'company_register_bloc.dart';

abstract class CompanyRegisterState extends Equatable {
  const CompanyRegisterState();

  @override
  List<Object> get props => [];
}

class CompanyRegisterInitial extends CompanyRegisterState {}

class CompanyRegisterLoading extends CompanyRegisterState {}

class CompanyRegisterSuccess extends CompanyRegisterState {}

class CompanyRegisterError extends CompanyRegisterState {
  final String error;

  const CompanyRegisterError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' CompanyRegisterError { error: $error }';
}
