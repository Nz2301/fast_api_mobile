import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
import 'package:flask_api_mobile/auth/ui/sign_up_page.dart';
import 'package:flask_api_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is InitialAuthState) {
        return SplashScreen();
      }
      return SignUpPage();
    });
  }
}
