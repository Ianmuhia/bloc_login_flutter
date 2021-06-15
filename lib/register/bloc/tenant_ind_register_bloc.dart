import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
// import 'package:login_test/bloc/authentication_bloc.dart';
import 'package:login_test/repository/user_repository.dart';

part 'tenant_ind_register_event.dart';
part 'tenant_ind_register_state.dart';

class TenantIndRegisterBloc
    extends Bloc<TenantIndRegisterEvent, TenantIndRegisterState> {
  TenantIndRegisterBloc(this.userRepository)
      : super(TenantIndRegisterInitial());

  final UserRepository userRepository;

  @override
  Stream<TenantIndRegisterState> mapEventToState(
    TenantIndRegisterEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      yield TenantIndRegisterInitial();

      try {
        await userRepository.TenantReg(
            password: event.password2,
            email: event.email,
            first_name: event.first_name,
            last_name: event.last_name,
            username: event.username,
            password2: event.password,
            phone: event.phone);

        // authenticationBloc.add(LoggedIn(user: user));
        yield TenantIndRegisterSuccess();
      } catch (error) {
        yield TenantIndRegisterError(error: error.toString());
      }
    }
  }
}
