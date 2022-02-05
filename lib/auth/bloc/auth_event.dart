part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStartEvent extends AuthEvent {}

class LogedIn extends AuthEvent {}

class LogedOut extends AuthEvent {}

class SignUp extends AuthEvent {}

class UserDelete extends AuthEvent {}
