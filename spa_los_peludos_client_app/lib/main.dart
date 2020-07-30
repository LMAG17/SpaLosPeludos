import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_los_peludos_client_app/backend/bloc/Authentication/authentication_bloc.dart';
import 'package:spa_los_peludos_client_app/backend/repository/user_repository.dart';
import 'package:spa_los_peludos_client_app/frontend/ui/home_screen.dart';
import 'package:spa_los_peludos_client_app/frontend/ui/login_screen.dart';
import 'package:spa_los_peludos_client_app/frontend/ui/splash_screen.dart';

import 'backend/bloc/Authentication/Authentication_bloc_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) =>
          AuthenticationBloc(userRepository: userRepository)..add(AppStarted()),
      child: App(
        userRepository: userRepository,
      ),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;
  const App({Key key, userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xff3a3cad),
          primaryColorLight: Color(0xff7167e0),
          primaryColorDark: Color(0xff00157d)),
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is Uninitialized) {
          return SplashScreen();
        }
        if (state is Authenticated) {
          return HomeScreen(user: state.user);
        } else if (state is UnAuthenticated) {
          return LoginScreen(
            userRepository: _userRepository,
          );
        } else {
          print(state);
          return Container(
            child: Center(child: Text("No encuentra el estado")),
          );
        }
      }),
    );
  }
}
