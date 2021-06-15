import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test/company_register/Comp_register.dart';
import 'package:login_test/company_register/bloc/company_register_bloc.dart';
import 'package:login_test/repository/user_repository.dart';

class CompRegisterScreen extends StatelessWidget {
  final UserRepository _userRepository;

  CompRegisterScreen({Key? key, required UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: BlocProvider<CompanyRegisterBloc>(
          create: (context) => CompanyRegisterBloc(_userRepository),
          child: CompRegisterForm(),
        ),
      ),
    );
  }
}
