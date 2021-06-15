part of 'tenant_ind_register_bloc.dart';

abstract class TenantIndRegisterEvent extends Equatable {
  const TenantIndRegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressed extends TenantIndRegisterEvent {
  final String password;
  final String password2;
  final String email;
  final String first_name;
  final String last_name;
  final String username;
  final String phone;

  const RegisterButtonPressed({
    required this.password,
    required this.password2,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.username,
    required this.phone,
  });

  @override
  List<Object> get props =>
      [username, password, email, first_name, last_name, phone];

  @override
  String toString() =>
      'RegisterButtonPressed { username: $username, password: $password, email: $email , last_name: $last_name,first_name: $first_name, phone: $phone}';
}
