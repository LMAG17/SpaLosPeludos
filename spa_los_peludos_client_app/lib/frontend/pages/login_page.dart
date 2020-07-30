import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_los_peludos_client_app/backend/bloc/Authentication/Authentication_bloc_export.dart';
import 'package:spa_los_peludos_client_app/backend/bloc/Login/Login_bloc_export.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, state) {
        if (state is Loading) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: <Widget>[
                  Text("Iniciando Sesión"),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        } else if (state is Failure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: <Widget>[
                  Text("Fallo al Iniciar Sesión"),
                  Icon(Icons.error),
                ],
              ),
            ),
          );
        } else if (state is Success) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GoogleSignInButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(LoginWithGoogle());
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
