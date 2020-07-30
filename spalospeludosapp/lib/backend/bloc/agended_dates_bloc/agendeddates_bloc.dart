import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spalospeludosapp/backend/bloc/agended_dates_bloc/agended_dates_bloc.dart';
import 'package:spalospeludosapp/backend/repository/agended_dates_repository.dart';

class AgendedDatesBloc extends Bloc<AgendedDatesEvent, AgendedDatesState> {
  final AgendedDatesRepository _agendedDatesRepository;
  StreamSubscription _agendedDatesSubscription;

  AgendedDatesBloc({@required AgendedDatesRepository agendedDatesRepository})
      : assert(agendedDatesRepository != null),
        _agendedDatesRepository = agendedDatesRepository,
        super(AgendedDatesLoading());

  @override
  Stream<AgendedDatesState> mapEventToState(AgendedDatesEvent event) async* {
    if (event is LoadAgendedDates) {
      yield* _mapLoadAgendedDatesToState();
    } else if (event is CompleteDate) {
      yield* _maCompleteDateToState(event);
    } else if (event is AddAgendedDates) {
      yield* _mapAddAgendedDatesToState(event);
    } else if (event is LoadAgendDetail) {
      yield AgendDetail(agend: event.agendedDate);
    } else if (event is UpdateAgendedDates) {
      yield* _mapUpdateAgendedDatesToState(event);
    } else if (event is DeleteAgendedDates) {
      yield* _mapDeleteAgendedDatesToState(event);
    } else if (event is AgendedDatesUpdated) {
      yield* _mapAgendedDatesUpdateToState(event);
    }
  }

  Stream<AgendedDatesState> _mapLoadAgendedDatesToState() async* {
    _agendedDatesSubscription?.cancel();
    _agendedDatesSubscription = _agendedDatesRepository.agendedDates().listen(
      (agendedDates) {
        print(agendedDates.toString());
        add(AgendedDatesUpdated(agendedDates));
      },
    );
  }

  Stream<AgendedDatesState> _mapAddAgendedDatesToState(
      AddAgendedDates event) async* {
    _agendedDatesRepository.addNewAgendedDates(event.agendedDates);
  }

  Stream<AgendedDatesState> _maCompleteDateToState(CompleteDate event) async* {
    yield AgendedDatesLoading();
    try {
      _agendedDatesRepository.completeDate(event.agend,event.comments,event.total);
    } catch (e) {
    }
  }

  Stream<AgendedDatesState> _mapUpdateAgendedDatesToState(
      UpdateAgendedDates event) async* {
    _agendedDatesRepository.updateAgendedDates(event.updatedAgendedDates);
  }

  Stream<AgendedDatesState> _mapDeleteAgendedDatesToState(
      DeleteAgendedDates event) async* {
    _agendedDatesRepository.deleteAgendedDates(event.agendedDates);
  }

  Stream<AgendedDatesState> _mapAgendedDatesUpdateToState(
      AgendedDatesUpdated event) async* {
    yield AgendedDatesLoaded(event.agendedDatess);
  }

  @override
  Future<void> close() {
    _agendedDatesSubscription?.cancel();
    return super.close();
  }
}
