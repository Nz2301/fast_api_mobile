// import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
// import 'package:flask_api_mobile/auth/repository/user_repository.dart';
// import 'package:flask_api_mobile/sign_up/bloc/sign_up_bloc.dart';
// import 'package:flask_api_mobile/sign_up/ui/sign_up_form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SignUpPage extends StatelessWidget {
//   static Route route() {
//     return MaterialPageRoute<void>(builder: (_) => SignUpPage());
//   }

//   AuthBloc _authBloc = AuthBloc();
//   UserRepository _userRepository = UserRepository();

//   @override
//   Widget build(BuildContext context) {
//     // final _userRepository = RepositoryProvider.of<UserRepository>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(12),
//         child: BlocProvider(
//           create: (context) {
//             return SignUpBloc(_authBloc, _userRepository);
//           },
//           child: SignUpForm(),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
import 'package:flask_api_mobile/auth/repository/user_repository.dart';
import 'package:flask_api_mobile/sign_up/bloc/sign_up_bloc.dart';
import 'package:flask_api_mobile/sign_up/ui/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // late UserRepository _userRepository;
  // late AuthBloc _authBloc;

  // @override
  // void initState() {
  //   _authBloc = BlocProvider.of<AuthBloc>(context);
  //   _userRepository = RepositoryProvider.of<UserRepository>(context);

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    AuthBloc _authBloc = AuthBloc();
    UserRepository _userRepository = UserRepository();
    log("this is inside sign up page");
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is InitialAuthState) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: BlocProvider<SignUpBloc>(
                create: (context) {
                  return SignUpBloc(_authBloc, _userRepository);
                },
                child: SignUpForm(),
              ),
            );
            // return Container(
            //   child: BlocProvider<SignUpBloc>(
            //     create: (context) => SignUpBloc(_authBloc, _userRepository),
            //     child: SignUpForm(),
            //   ),
            // );
          }
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }));
  }
}
