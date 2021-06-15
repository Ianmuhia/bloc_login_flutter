import 'package:flutter/material.dart';
import 'package:login_test/company_register/Comp_Register_page.dart';
import 'package:login_test/repository/user_repository.dart';

class CompanyRegister extends StatelessWidget {
  final UserRepository _userRepository;

  CompanyRegister({Key? key, required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create a Company Account',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return CompRegisterScreen(userRepository: _userRepository);
          }),
        );
      },
    );
  }
}
