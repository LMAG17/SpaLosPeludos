import 'package:flutter/cupertino.dart';
import 'package:spalospeludosapp/backend/models/user_form_model.dart';

abstract class UserFormEvent {
  const UserFormEvent();

  List<Object> get props => [];
}

class LoadUserForm extends UserFormEvent {}

class AddAgend extends UserFormEvent {
  final UserForm userForm;
  final String observations;
  final DateTime reservationDate;

  const AddAgend({
    @required this.userForm,
    @required this.observations,
    @required this.reservationDate,
  });

  @override
  List<Object> get props => [userForm, observations, reservationDate];

  @override
  String toString() =>
      'AddAgend { userForm: $userForm ,observations: $observations ,reservationDate: $reservationDate }';
}

class UpdateUserForm extends UserFormEvent {
  final UserForm updatedUserForm;

  const UpdateUserForm(this.updatedUserForm);

  @override
  List<Object> get props => [updatedUserForm];

  @override
  String toString() => 'UpdateUserForm { updatedUserForm: $updatedUserForm }';
}

class DeleteUserForm extends UserFormEvent {
  final UserForm userForm;

  const DeleteUserForm(this.userForm);

  @override
  List<Object> get props => [userForm];

  @override
  String toString() => 'DeleteUserForm { userForm: $userForm }';
}

class UserFormUpdated extends UserFormEvent {
  final List<UserForm> userForms;

  const UserFormUpdated(this.userForms);
  @override
  List<Object> get props => [userForms];
}

class Agend extends UserFormEvent {
  final UserForm userForm;

  Agend({@required this.userForm});

  @override
  List<Object> get props => [userForm];

  @override
  String toString() => 'Agend { userForm: $userForm }';

}
