import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
import 'package:flask_api_mobile/sign_up/ui/sign_up_page.dart';
import 'package:flask_api_mobile/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // runApp(BlocProvider(
  //   create: (context) {
  //     return AuthBloc();
  //   },
  //   child: App(),
  // ));
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuthBloc();
    _authBloc.add(AuthStartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _authBloc,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthAtuthenticated) {
                return HomePage();
              }
              if (state is AuthNotAuthenticated) {
                return Container(
                  child: Center(
                    child: Text("Center"),
                  ),
                );
              }
              return SignUpPage();
            },
          )),
    );
  }
}
