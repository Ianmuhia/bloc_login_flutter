import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test/login/bloc/login_bloc.dart';
import 'package:login_test/login/company_register_button.dart';
import 'package:login_test/login/create_account_button.dart';
import 'package:login_test/repository/user_repository.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({Key? key, required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  UserRepository get _userRepository => widget._userRepository;

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      print(_usernameController.text);
      print(_passwordController.text);
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFaliure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'username', icon: Icon(Icons.person)),
                      controller: _usernameController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'password', icon: Icon(Icons.security)),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.width * 0.22,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30.0),
                              child: RaisedButton(
                                onPressed: state is! LoginLoading
                                    ? _onLoginButtonPressed
                                    : null,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 24.0,
                                  ),
                                ),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CreateAccountButton(userRepository: _userRepository),
                          CompanyRegister(userRepository: _userRepository),
                        ],
                      ),
                    ),
                    Container(
                      child: state is LoginLoading
                          ? CircularProgressIndicator()
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
