import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:spalospeludosapp/backend/bloc/complete_dates_bloc/complete_dates_bloc.dart';


class CompletedatesBloc extends Bloc<CompletedatesEvent, CompletedatesState> {
  CompletedatesBloc() : super(CompletedatesInitial());

  @override
  Stream<CompletedatesState> mapEventToState(
    CompletedatesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
