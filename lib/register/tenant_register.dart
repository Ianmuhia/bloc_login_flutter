import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test/login/login_page.dart';
import 'package:login_test/register/bloc/tenant_ind_register_bloc.dart';
import 'package:login_test/repository/user_repository.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // final UserRepository userRepository;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _last_nameController = TextEditingController();
  final _password2Controller = TextEditingController();
  final _first_nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // _RegisterFormState(this.userRepository);

  @override
  Widget build(BuildContext context) {
    _onRegisterButtonPressed() {
      print("username: " + _usernameController.text);
      print("password2: " + _password2Controller.text);
      print("email: " + _emailController.text);
      print("password: " + _passwordController.text);
      print("last_name: " + _last_nameController.text);
      print("first_name: " + _first_nameController.text);
      print("phone: " + _phoneController.text);
      BlocProvider.of<TenantIndRegisterBloc>(context).add(RegisterButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
        last_name: _usernameController.text,
        password2: _passwordController.text,
        first_name: _usernameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
      ));
    }

    return BlocListener<TenantIndRegisterBloc, TenantIndRegisterState>(
      listener: (context, state) {
        if (state is TenantIndRegisterError) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<TenantIndRegisterBloc, TenantIndRegisterState>(
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'phone', icon: Icon(Icons.phone_android)),
                      controller: _phoneController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'email', icon: Icon(Icons.person)),
                      controller: _emailController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'first_name', icon: Icon(Icons.person)),
                      controller: _first_nameController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'last_name', icon: Icon(Icons.person)),
                      controller: _last_nameController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'password', icon: Icon(Icons.security)),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'password2', icon: Icon(Icons.security)),
                      controller: _password2Controller,
                      obscureText: true,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.width * 0.22,
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: RaisedButton(
                          onPressed: state is! TenantIndRegisterLoading
                              ? _onRegisterButtonPressed
                              : null,
                          child: Text(
                            'Regsiter',
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
                    Container(
                      child: state is TenantIndRegisterLoading
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
