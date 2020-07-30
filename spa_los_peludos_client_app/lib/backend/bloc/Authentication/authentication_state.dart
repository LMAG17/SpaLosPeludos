import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationState {
  List<Object> get props => [props];
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'No inicializado';
}

class UnAuthenticated extends AuthenticationState {
  @override
  String toString() => 'No autenticado';
}

class Authenticated extends AuthenticationState {
  final FirebaseUser user;

  Authenticated({@required this.user});
  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Bienvenido usuario ${user.displayName}';
}
