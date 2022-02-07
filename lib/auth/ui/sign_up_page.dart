import 'package:flask_api_mobile/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(listener: (context, state) {
      if (state is SignUpState) {
        child:
        Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (String? inValue) {
                    if (inValue?.length == 0) {
                      return "Please Enter First Name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (String? inValue) {
                    if (inValue?.length == 0) {
                      return "Please Enter Last Name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? inValue) {
                    if (inValue?.length == 0) {
                      return "Please Enter email";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? inValue) {
                    if (inValue?.length == 0) {
                      return "Please Enter password";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
