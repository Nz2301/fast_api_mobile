import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthState());

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthStartEvent) {
      yield InitialAuthState();
    }
  }
}
