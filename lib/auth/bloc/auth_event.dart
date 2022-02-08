part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStartEvent extends AuthEvent {}

class UserLogedInEvent extends AuthEvent {
  final String user;

  UserLogedInEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class UserLogedOutEvent extends AuthEvent {}

class UserDeleteEvent extends AuthEvent {}
