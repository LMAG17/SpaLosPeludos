import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spalospeludosapp/backend/repository/form_repository.dart';
import './bloc.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  final UserFormRepository _userFormRepository;
  StreamSubscription _userFormSubscription;

  UserFormBloc({@required UserFormRepository userFormRepository})
      : assert(userFormRepository != null),
        _userFormRepository = userFormRepository,
        super(UserFormLoading());

  @override
  Stream<UserFormState> mapEventToState(UserFormEvent event) async* {
    if (event is LoadUserForm) {
      yield* _mapLoadUserFormToState();
    } else if (event is Agend) {
      yield Agending(
        userForm: event.userForm,
      );
    } else if (event is AddAgend) {
      yield* _mapAddAgendToState(event);
    } else if (event is UpdateUserForm) {
      yield* _mapUpdateUserFormToState(event);
    } else if (event is DeleteUserForm) {
      yield* _mapDeleteUserFormToState(event);
    } else if (event is UserFormUpdated) {
      yield* _mapUserFormUpdateToState(event);
    }
  }

  Stream<UserFormState> _mapLoadUserFormToState() async* {
    _userFormSubscription?.cancel();
    _userFormSubscription = _userFormRepository.userForm().listen(
      (userForm) {
        print(userForm.toString());
        add(UserFormUpdated(userForm));
      },
    );
  }

  Stream<UserFormState> _mapAddAgendToState(AddAgend event) async* {
    _userFormRepository.addNewAgend(
      event.userForm,
      event.reservationDate,
      event.observations,
    );
  }

  Stream<UserFormState> _mapUpdateUserFormToState(UpdateUserForm event) async* {
    _userFormRepository.updateUserForm(event.updatedUserForm);
  }

  Stream<UserFormState> _mapDeleteUserFormToState(DeleteUserForm event) async* {
    _userFormRepository.deleteUserForm(event.userForm);
  }

  Stream<UserFormState> _mapUserFormUpdateToState(
      UserFormUpdated event) async* {
    yield UserFormLoaded(event.userForms);
  }

  @override
  Future<void> close() {
    _userFormSubscription?.cancel();
    return super.close();
  }
}
