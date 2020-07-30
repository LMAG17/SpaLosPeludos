import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_los_peludos_client_app/backend/bloc/Login/Login_bloc_export.dart';
import 'package:spa_los_peludos_client_app/backend/repository/user_repository.dart';
import 'package:spa_los_peludos_client_app/frontend/pages/login_page.dart';
class LoginScreen extends StatelessWidget {
  final _userRepository;
  const LoginScreen({Key key,@required UserRepository userRepository}) :assert(userRepository!=null),_userRepository=userRepository, super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) =>LoginBloc(userRepository: _userRepository),
      child: LoginPage(),
    );
  }
}