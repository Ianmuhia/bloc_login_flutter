part of 'company_register_bloc.dart';

abstract class CompanyRegisterEvent extends Equatable {
  const CompanyRegisterEvent();

  @override
  List<Object> get props => [];
}

class CompanyRegisterButtonPressed extends CompanyRegisterEvent {
  final String password;
  final String password2;
  final String email;
  final String company_name;
  final String username;
  final String phone;

  const CompanyRegisterButtonPressed({
    required this.password,
    required this.password2,
    required this.email,
    required this.company_name,
    required this.username,
    required this.phone,
  });

  @override
  List<Object> get props => [username, password, email, company_name, phone];

  @override
  String toString() =>
      'CompanyRegisterButtonPressed { username: $username, password: $password, email: $email , company_name: $company_name, phone: $phone}';
}
