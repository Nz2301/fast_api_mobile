import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
import 'package:flask_api_mobile/auth/repository/user_repository.dart';
import 'package:flask_api_mobile/sign_up/bloc/sign_up_bloc.dart';
import 'package:flask_api_mobile/sign_up/ui/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SignUpPage());
  }

  AuthBloc _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return SignUpBloc(
                _authBloc, RepositoryProvider.of<UserRepository>(context));
          },
          child: SignUpForm(),
        ),
      ),
    );
  }
}
