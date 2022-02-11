import 'dart:developer';

import 'package:flask_api_mobile/sign_up/bloc/sign_up_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpForm createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _signUpBloc = BlocProvider.of<SignUpBloc>(context);

    _onLoginButtonPressed() {
      log("this is key: ${_key.currentState!.validate()}");
      if (_key.currentState!.validate()) {
        _signUpBloc.add(SignUpWithEmailEvent(
            first_name: _firstNameController.text,
            last_name: _lastNameController.text,
            e_mail: _emailController.text,
            password: _passwordController.text));
        log("context");
      } else {
        log("validate else");
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
        if (state is SignUpLoading) {
          Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SignUpInitial) {
          log("this is inside state");
          Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      filled: true,
                      isDense: true,
                    ),
                    controller: _firstNameController,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null) {
                        return 'First Name is required.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      filled: true,
                      isDense: true,
                    ),
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null) {
                        return 'Last Name is required.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      filled: true,
                      isDense: true,
                    ),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null) {
                        return 'Email is required.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      isDense: true,
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null) {
                        return 'Password is required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0)),
                    child: Text('SIGN UP'),
                    onPressed: state is SignUpLoading
                        ? () {
                            log("this is inside empty brackets");
                          }
                        : _onLoginButtonPressed,
                  )
                ],
              ),
            ),
          );
        }
        return Container(
          child: Center(
            child: Text("0"),
          ),
        );
      },
    );
  }
}
