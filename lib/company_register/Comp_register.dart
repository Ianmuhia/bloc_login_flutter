import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test/company_register/bloc/company_register_bloc.dart';

class CompRegisterForm extends StatefulWidget {
  @override
  State<CompRegisterForm> createState() => _CompRegisterFormState();
}

class _CompRegisterFormState extends State<CompRegisterForm> {
  // final UserRepository userRepository;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();
  final _company_nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onRegisterButtonPressed() {
      print("username: " + _usernameController.text);
      print("password2: " + _password2Controller.text);
      print("email: " + _emailController.text);
      print("password: " + _passwordController.text);
      print("company_name: " + _company_nameController.text);
      print("phone: " + _phoneController.text);
      BlocProvider.of<CompanyRegisterBloc>(context)
          .add(CompanyRegisterButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
        company_name: _company_nameController.text,
        password2: _passwordController.text,
        email: _emailController.text,
        phone: _phoneController.text,
      ));
    }

    return BlocListener<CompanyRegisterBloc, CompanyRegisterState>(
      listener: (context, state) {
        if (state is CompanyRegisterError) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<CompanyRegisterBloc, CompanyRegisterState>(
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
                          labelText: 'comapnyname', icon: Icon(Icons.person)),
                      controller: _company_nameController,
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
                          onPressed: state is! CompanyRegisterLoading
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
                      child: state is CompanyRegisterLoading
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
