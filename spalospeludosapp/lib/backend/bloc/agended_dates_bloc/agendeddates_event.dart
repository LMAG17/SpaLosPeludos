
import 'package:flutter/cupertino.dart';
import 'package:spalospeludosapp/backend/models/agended_date_model.dart';

abstract class AgendedDatesEvent {
  const AgendedDatesEvent();

  List<Object> get props => [];
}

class LoadAgendedDates extends AgendedDatesEvent {}

class AddAgendedDates extends AgendedDatesEvent {
  final AgendedDate agendedDates;

  const AddAgendedDates(this.agendedDates);

  @override
  List<Object> get props => [agendedDates];

  @override
  String toString() => 'AddAgendedDates { agendedDates: $agendedDates }';
}

class CompleteDate extends AgendedDatesEvent {
  final AgendedDate agend;
  final String comments;
  final String total;
  const CompleteDate({@required this.agend, @required this.comments, @required this.total});

  @override
  List<Object> get props => [agend];

  @override
  String toString() => 'CompleteDate { agend: $agend }';
}

class UpdateAgendedDates extends AgendedDatesEvent {
  final AgendedDate updatedAgendedDates;

  const UpdateAgendedDates(this.updatedAgendedDates);

  @override
  List<Object> get props => [updatedAgendedDates];

  @override
  String toString() => 'UpdateAgendedDates { updatedAgendedDates: $updatedAgendedDates }';
}

class LoadAgendDetail extends AgendedDatesEvent {
  final AgendedDate agendedDate;

  const LoadAgendDetail(this.agendedDate);

  @override
  List<Object> get props => [agendedDate];

  @override
  String toString() => 'LoadAgendDetail { agendedDate: $agendedDate }';
}


class DeleteAgendedDates extends AgendedDatesEvent {
  final AgendedDate agendedDates;

  const DeleteAgendedDates(this.agendedDates);

  @override
  List<Object> get props => [agendedDates];

  @override
  String toString() => 'DeleteAgendedDates { agendedDates: $agendedDates }';
}

class ClearCompleted extends AgendedDatesEvent {}

class ToggleAll extends AgendedDatesEvent {}

class AgendedDatesUpdated extends AgendedDatesEvent {
  final List<AgendedDate> agendedDatess;

  const AgendedDatesUpdated(this.agendedDatess);
  @override
  List<Object> get props => [agendedDatess];
}
