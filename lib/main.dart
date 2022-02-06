import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
import 'package:flask_api_mobile/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthBloc(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("data"),
          ),
          body: HomePage(),
        ),
      ),
    );
  }
}
