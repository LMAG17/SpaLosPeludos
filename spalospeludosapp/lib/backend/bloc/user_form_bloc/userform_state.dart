import 'package:flutter/cupertino.dart';
import 'package:spalospeludosapp/backend/models/user_form_model.dart';

abstract class UserFormState {
  UserFormState();

  List<Object> get props => [];
}

class UserFormLoading extends UserFormState {}

class UserFormLoaded extends UserFormState {
  final List<UserForm> userForms;

  UserFormLoaded([this.userForms = const []]);

  @override
  List<Object> get props => [userForms];

  @override
  String toString() => 'UserFormLoaded { userForms: $userForms }';
}

class UserFormNaotLoaded extends UserFormState {}

class Agending extends UserFormState{
  final UserForm userForm;

  Agending({@required this.userForm});

  @override
  List<Object> get props => [userForm];

  @override
  String toString() => 'Agending { userForm: $userForm }';
}
