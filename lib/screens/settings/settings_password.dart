import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:rules/rules.dart';

class SettingsPassword extends StatefulWidget {
  SettingsPassword({Key key}) : super(key: key);

  @override
  _SettingsPasswordState createState() => _SettingsPasswordState();
}

class _SettingsPasswordState extends State<SettingsPassword> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit password"),
        actions: <Widget>[
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
            if (state is Authenticated) {
              return IconButton(
                icon: Icon(EvaIcons.checkmark),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    BlocProvider.of<AuthenticationBloc>(context).add(
                      UpdatePassword(password: _passwordController.text),
                    );
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Password changed successfully.'),
                              Icon(
                                EvaIcons.checkmarkCircle2,
                                color: Colors.green[800],
                              ),
                            ],
                          ),
                        ),
                      );
                  }
                },
              );
            }
          }),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: _passwordController,
                validator: (password) {
                  final rule = Rule(
                    password,
                    name: "password",
                    isRequired: true,
                    minLength: 8,
                  );

                  return rule.hasError ? rule.error : null;
                },
                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Enter new password'),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Choose a strong password that other people can't guess.",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
