import 'dart:developer';

import 'package:flask_api_mobile/auth/model/user.dart';
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
  UserRepository _repository = new UserRepository();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthStartEvent) {
      log("AuthStartEvent");
      yield* _appStartEventToState(event);
    }
    if (event is UserLogedInEvent) {
      log("UserLogedInEvent");
      yield* _userLogedInEventToState(event);
    }
    if (event is UserLogedOutEvent) {
      log("UserLogedOutEvent");
      yield* _userLogedOutToState(event);
    }
  }

  Stream<AuthState> _appStartEventToState(AuthStartEvent event) async* {
    yield AuthLoadding();
    try {
      await Future.delayed(Duration(milliseconds: 500));
      final currentUser = await _repository.getEmail();

      if (currentUser != null) {
        yield AuthAtuthenticated(user: currentUser);
      } else {
        yield AuthNotAuthenticated();
      }
    } catch (e) {
      yield AuthFailure(message: "unknown error $e");
    }
  }

  Stream<AuthState> _userLogedInEventToState(UserLogedInEvent event) async* {
    yield AuthAtuthenticated(user: event.user);
  }

  Stream<AuthState> _userLogedOutToState(UserLogedOutEvent event) async* {
    await _repository.deleteEmail();
    yield AuthNotAuthenticated();
  }

  // Stream<AuthState> _mapSignUpEventToState(SignUpEvent event) async* {
  //   yield InitialAuthState();

  //   try {
  //     await Future.delayed(Duration(milliseconds: 500));
  //     final currentUser = await _repository.saveUser(
  //         event.first_name, event.last_name, event.email, event.password);
  //     if (currentUser != null) {
  //       yield SignUpSuccessState();
  //     }
  //   } catch (e) {
  //     throw "Unknown Exeption";
  //   }
  //   // final String email = _secureStorage.getEmail() as String;
  //   // if (email == null) {
  //   //   yield SignUpState();
  //   // }
  // }
}
