import 'package:flutter/cupertino.dart';
import 'package:spalospeludosapp/backend/models/agended_date_model.dart';

abstract class AgendedDatesState {
  AgendedDatesState();

  List<Object> get props => [];
}

class AgendedDatesLoading extends AgendedDatesState {}

class AgendedDatesLoaded extends AgendedDatesState {
  final List<AgendedDate> agendedDates;

  AgendedDatesLoaded([this.agendedDates = const []]);

  @override
  List<Object> get props => [agendedDates];

  @override
  String toString() => 'AgendedDatesLoaded { agendedDates: $agendedDates }';
}

class AgendDetail extends AgendedDatesState {
  final AgendedDate agend;

  AgendDetail({@required this.agend} );

  @override
  List<Object> get props => [agend];

  @override
  String toString() => 'AgendDetail { agendDetail: $agend }';
}

class AgendedDatesNaotLoaded extends AgendedDatesState {}
