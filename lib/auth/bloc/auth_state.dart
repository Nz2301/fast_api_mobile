part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  List<Object?> get props => [];
}

class InitialAuthState extends AuthState {}

class SignInState extends AuthState {}

class SignOutState extends AuthState {}

class SignUpState extends AuthState {}

class UserDeleteState extends AuthState {}
