import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class Empty extends LoginState {}
class Loading extends LoginState {}
class Success extends LoginState {}
class Failure extends LoginState {}