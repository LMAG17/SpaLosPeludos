
import 'package:equatable/equatable.dart';
import 'package:spalospeludosapp/backend/models/completed_dates_model.dart';

abstract class CompletedDatesEvent extends Equatable {
  const CompletedDatesEvent();

  List<Object> get props => [];

}

class LoadCompletedDates extends CompletedDatesEvent {}

class AddCompletedDates extends CompletedDatesEvent {
  final CompletedDate completedDate;

  const AddCompletedDates(this.completedDate);

  @override
  List<Object> get props => [completedDate];

  @override
  String toString() => 'AddCompletedDates { completedDate: $completedDate }';
}

class UpdateCompletedDates extends CompletedDatesEvent {
  final CompletedDate updatedCompletedDates;

  const UpdateCompletedDates(this.updatedCompletedDates);

  @override
  List<Object> get props => [updatedCompletedDates];

  @override
  String toString() => 'UpdateCompletedDates { updatedCompletedDates: $updatedCompletedDates }';
}

class LoadCompleteDetail extends CompletedDatesEvent {
  final CompletedDate completeDate;

  const LoadCompleteDetail(this.completeDate);

  @override
  List<Object> get props => [completeDate];

  @override
  String toString() => 'LoadCompleteDetail { completeDate: $completeDate }';
}


class DeleteCompletedDates extends CompletedDatesEvent {
  final CompletedDate completedDate;

  const DeleteCompletedDates(this.completedDate);

  @override
  List<Object> get props => [completedDate];

  @override
  String toString() => 'DeleteCompletedDates { completedDate: $completedDate }';
}

class ClearCompleted extends CompletedDatesEvent {}

class ToggleAll extends CompletedDatesEvent {}

class CompletedDatesUpdated extends CompletedDatesEvent {
  final List<CompletedDate> completedDates;

  const CompletedDatesUpdated(this.completedDates);
  @override
  List<Object> get props => [completedDates];
}
