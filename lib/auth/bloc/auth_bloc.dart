import 'package:flask_api_mobile/auth/repository/user_repository.dart';
import 'package:flask_api_mobile/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(InitialAuthState());
  SecureStorage _secureStorage = new SecureStorage();
  late String e_mail;
  UserRepository _repository = new UserRepository();

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthStartEvent) {
      yield InitialAuthState();
    }
    if (event is SignUpEvent) {
      e_mail = _secureStorage.getEmail() as String;

      if (e_mail != null) {
        yield InitialAuthState();
      }
      yield SignUpState();
    }
    if (event is AuthStartEvent) {
      yield InitialAuthState();
    }
    yield SignUpState();
  }

  Stream<AuthState> _mapSignUpStateToSignUpEvent(SignUpEvent event) async* {
    yield InitialAuthState();
    final Future<String?> email = _secureStorage.getEmail();
    if (email == null) {
      yield SignUpState();
    }
  }
}
