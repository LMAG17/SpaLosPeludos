import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_los_peludos_client_app/backend/bloc/Authentication/Authentication_bloc_export.dart';
import 'package:spa_los_peludos_client_app/backend/bloc/Authentication/authentication_bloc.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseUser _user;
  const HomeScreen({Key key, @required user})
      : assert(user != null),
        _user = user,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spa Los Peludos"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () =>
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Bienvenido ${_user.displayName}"),
        ],
      ),
    );
  }
}
