import 'package:flutter/cupertino.dart';
import 'package:spalospeludosapp/backend/models/completed_dates_model.dart';

abstract class CompletedDatesState {
  CompletedDatesState();

  List<Object> get props => [];
}

class CompletedDatesLoading extends CompletedDatesState {}

class CompletedDatesLoaded extends CompletedDatesState {
  final List<CompletedDate> completedDates;

  CompletedDatesLoaded([this.completedDates = const []]);

  @override
  List<Object> get props => [completedDates];

  @override
  String toString() => 'CompletedDatesLoaded { completedDates: $completedDates }';
}

class CompleteDetail extends CompletedDatesState {
  final CompletedDate date;

  CompleteDetail({@required this.date} );

  @override
  List<Object> get props => [date];

  @override
  String toString() => 'CompleteDetail { dateDetail: $date }';
}

class CompletedDatesNaotLoaded extends CompletedDatesState {}
