import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:spa_los_peludos_client_app/backend/bloc/Authentication/Authentication_bloc_export.dart';
import 'package:spa_los_peludos_client_app/backend/repository/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;
  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(Uninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedIntToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartToState() async* {
    try {
      print("deberias pasar por  aqui");
      final isSignedIn = await _userRepository.idSignedIn();
      if (isSignedIn != null) {
        yield Authenticated(user: isSignedIn);
      } else {
        yield UnAuthenticated();
      }
    } catch (_) {
      yield UnAuthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedIntToState() async* {
    try {
      final isSignedIn = await _userRepository.idSignedIn();
      yield Authenticated(user: isSignedIn);
    } catch (_) {
      yield UnAuthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    await _userRepository.signOut();
    yield UnAuthenticated();
  }
}
