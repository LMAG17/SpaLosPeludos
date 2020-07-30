import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:spa_los_peludos_client_app/backend/bloc/Login/Login_bloc_export.dart';
import 'package:spa_los_peludos_client_app/backend/repository/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  LoginBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(Empty());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginWithGoogle) {
      yield* _mapLoginWithGoogleToState();
    }
  }

  Stream<LoginState> _mapLoginWithGoogleToState() async* {
    yield Loading();
    try {
      await _userRepository.signInWithGoogle();
      yield Success();
    } catch (e) {
      yield Failure();
    }
  }
}
