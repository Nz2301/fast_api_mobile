// import 'dart:developer';

// import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
// import 'package:flask_api_mobile/auth/repository/user_repository.dart';
// import 'package:flask_api_mobile/sign_up/bloc/sign_up_bloc.dart';
// import 'package:flask_api_mobile/sign_up/ui/sign_up_form.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   late UserRepository userRepository;
//   late AuthBloc authBloc;

//   @override
//   void initState() {
//     log("message");
//     userRepository = RepositoryProvider.of<UserRepository>(context);
//     log("$userRepository");
//     authBloc = BlocProvider.of<AuthBloc>(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     log("$userRepository");
//     return Scaffold(
//         body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
//       if (state is InitialAuthState) {
//         return Container(
//           child: BlocProvider<SignUpBloc>(
//             create: (context) => SignUpBloc(
//                 authBloc = authBloc, userRepository = userRepository),
//             child: SignUpPage(),
//           ),
//         );
//       }
//       return Center(
//         child: CircularProgressIndicator(
//           strokeWidth: 2,
//         ),
//       );
//     }));
//   }
// }


// // class _SignUpPageState extends State<SignUpPage> {
// //   GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
// //       if (state is InitialAuthState) {
// //         return Container(
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               children: [
// //                 TextFormField(
// //                   keyboardType: TextInputType.text,
// //                   validator: (String? inValue) {
// //                     if (inValue?.length == 0) {
// //                       return "Please Enter First Name";
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 TextFormField(
// //                   keyboardType: TextInputType.text,
// //                   validator: (String? inValue) {
// //                     if (inValue?.length == 0) {
// //                       return "Please Enter Last Name";
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 TextFormField(
// //                   keyboardType: TextInputType.emailAddress,
// //                   validator: (String? inValue) {
// //                     if (inValue?.length == 0) {
// //                       return "Please Enter email";
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //                 TextFormField(
// //                   keyboardType: TextInputType.visiblePassword,
// //                   validator: (String? inValue) {
// //                     if (inValue?.length == 0) {
// //                       return "Please Enter password";
// //                     }
// //                     return null;
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       }
// //       if (state is InitialAuthState) {
// //         return Center(
// //           child: Text("Initial Auth State"),
// //         );
// //       }
// //       if (state is AuthLoadding) {
// //         return Center(
// //           child: Text("AuthLoadding State"),
// //         );
// //       }
// //       return Center(
// //         child: CircularProgressIndicator(
// //           strokeWidth: 2,
// //         ),
// //       );
// //     }));
// //   }
// // }






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

