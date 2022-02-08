import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
import 'package:flask_api_mobile/auth/ui/sign_up_page.dart';
import 'package:flask_api_mobile/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return AuthBloc()..add(AuthStartEvent());
    },
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthBloc(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthAtuthenticated) {
                return HomePage();
              }
              return SignUpPage();
            },
          )),
    );
  }
}
