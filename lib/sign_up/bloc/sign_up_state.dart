part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure({required this.error});

  @override
  List<Object> get props => [error];
}
