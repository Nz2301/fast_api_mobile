part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialAuthState extends AuthState {}

class AuthLoadding extends AuthState {}

class AuthNotAuthenticated extends AuthState {}

class AuthAtuthenticated extends AuthState {
  final String user;
  AuthAtuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}
