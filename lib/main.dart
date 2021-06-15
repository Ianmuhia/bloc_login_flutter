import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_test/bloc/authentication_bloc.dart';
import 'package:login_test/common/loading_indicator.dart';
import 'package:login_test/home/app_bloc_observer.dart';
import 'package:login_test/login/login_page.dart';
import 'package:login_test/repository/user_repository.dart';
import 'package:login_test/splash/splash_page.dart';

import 'home/home.dart';

const String API_BOX = "api_box";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(API_BOX);

  final userRepository = UserRepository();
  Bloc.observer = SimpleBlocObserver();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(
              userRepository: userRepository,
            );
          }
          return LoadingIndicator();
        },
      ),
    );
  }
}
