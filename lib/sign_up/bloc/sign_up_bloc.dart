import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
import 'package:flask_api_mobile/auth/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:bloc/bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthBloc _authBloc;
  final UserRepository _userRepository;

  SignUpBloc(AuthBloc authBloc, UserRepository userRepository)
      : _authBloc = authBloc,
        _userRepository = userRepository,
        super(SignUpInitial());

  // @override
  Stream<SignUpState> mapSignUpEventToState(SignUpEvent event) async* {
    if (event is SignUpWithEmailEvent) {
      yield* _mapSignUpWithEmailToState(event);
    }
  }

  Stream<SignUpState> _mapSignUpWithEmailToState(
      SignUpWithEmailEvent event) async* {
    yield SignUpLoading();

    try {
      final user = _userRepository.saveUser(
          event.first_name, event.last_name, event.e_mail, event.password);

      if (user != null) {
        _authBloc.add(UserLogedInEvent(user: user.toString()));
        yield SignUpSuccess();
        yield SignUpInitial();
      } else {
        yield SignUpFailure(error: 'Something very weird just happened');
      }
    } catch (err) {
      yield SignUpFailure(error: 'An unknown error occured $err');
    }
  }
}