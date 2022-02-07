part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStartEvent extends AuthEvent {}

class LogedInEvent extends AuthEvent {}

class LogedOutEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {}

class UserDeleteEvent extends AuthEvent {}
