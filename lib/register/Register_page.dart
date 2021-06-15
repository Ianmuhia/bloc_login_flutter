import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test/register/bloc/tenant_ind_register_bloc.dart';
import 'package:login_test/register/tenant_register.dart';
import 'package:login_test/repository/user_repository.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key? key, required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: BlocProvider<TenantIndRegisterBloc>(
          create: (context) => TenantIndRegisterBloc(_userRepository),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
