part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpWithEmailEvent extends SignUpEvent {
  final String first_name;
  final String last_name;
  final String e_mail;
  final String password;

  SignUpWithEmailEvent(
      {required this.first_name,
      required this.last_name,
      required this.e_mail,
      required this.password});

  @override
  List<Object> get props => [first_name, last_name, e_mail, password];
}
