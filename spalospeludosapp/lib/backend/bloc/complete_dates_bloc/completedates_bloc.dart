import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spalospeludosapp/backend/bloc/complete_dates_bloc/complete_dates_bloc.dart';
import 'package:spalospeludosapp/backend/repository/completed_dates_repository.dart';

class CompletedDatesBloc extends Bloc<CompletedDatesEvent, CompletedDatesState> {
  final CompletedDatesRepository _completeDatesRepository;
  StreamSubscription _completeDatesSubscription;

  CompletedDatesBloc({@required CompletedDatesRepository completeDatesRepository})
      : assert(completeDatesRepository != null),
        _completeDatesRepository = completeDatesRepository,
        super(CompletedDatesLoading());

  @override
  Stream<CompletedDatesState> mapEventToState(CompletedDatesEvent event) async* {
    if (event is LoadCompletedDates) {
      yield* _mapLoadCompletedDatesToState();
    } else if (event is AddCompletedDates) {
      yield* _mapAddCompletedDatesToState(event);
    } else if (event is LoadCompleteDetail) {
      yield CompleteDetail(date: event.completeDate);
    } else if (event is UpdateCompletedDates) {
      yield* _mapUpdateCompletedDatesToState(event);
    } else if (event is DeleteCompletedDates) {
      yield* _mapDeleteCompletedDatesToState(event);
    } else if (event is CompletedDatesUpdated) {
      yield* _mapCompletedDatesUpdateToState(event);
    }
  }

  Stream<CompletedDatesState> _mapLoadCompletedDatesToState() async* {
    _completeDatesSubscription?.cancel();
    _completeDatesSubscription = _completeDatesRepository.completeDates().listen(
      (completeDates) {
        print(completeDates.toString());
        add(CompletedDatesUpdated(completeDates));
      },
    );
  }

  Stream<CompletedDatesState> _mapAddCompletedDatesToState(
      AddCompletedDates event) async* {
    //_completeDatesRepository.addNewCompletedDates(event.completeDates);
  }


  Stream<CompletedDatesState> _mapUpdateCompletedDatesToState(
      UpdateCompletedDates event) async* {
    _completeDatesRepository.updateCompletedDates(event.updatedCompletedDates);
  }

  Stream<CompletedDatesState> _mapDeleteCompletedDatesToState(
      DeleteCompletedDates event) async* {
//_completeDatesRepository.deleteCompletedDates(event.completeDates);
  }

  Stream<CompletedDatesState> _mapCompletedDatesUpdateToState(
      CompletedDatesUpdated event) async* {
    yield CompletedDatesLoaded(event.completedDates);
  }

  @override
  Future<void> close() {
    _completeDatesSubscription?.cancel();
    return super.close();
  }
}
