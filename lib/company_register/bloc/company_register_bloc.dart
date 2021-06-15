import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_test/repository/user_repository.dart';

part 'company_register_event.dart';
part 'company_register_state.dart';

class CompanyRegisterBloc
    extends Bloc<CompanyRegisterEvent, CompanyRegisterState> {
  CompanyRegisterBloc(this.userRepository) : super(CompanyRegisterInitial());

  final UserRepository userRepository;

  @override
  Stream<CompanyRegisterState> mapEventToState(
    CompanyRegisterEvent event,
  ) async* {
    if (event is CompanyRegisterButtonPressed) {
      yield CompanyRegisterInitial();

      try {
        await userRepository.TenantCompRegister(
            password: event.password2,
            email: event.email,
            company_name: event.company_name,
            username: event.username,
            password2: event.password,
            phone: event.phone);

        // authenticationBloc.add(LoggedIn(user: user));
        yield CompanyRegisterSuccess();
      } catch (error) {
        yield CompanyRegisterError(error: error.toString());
      }
    }
  }
}
