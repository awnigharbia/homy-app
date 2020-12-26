import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:rules/rules.dart';

class SettingsUsername extends StatefulWidget {
  SettingsUsername({Key key}) : super(key: key);

  @override
  _SettingsUsernameState createState() => _SettingsUsernameState();
}

class _SettingsUsernameState extends State<SettingsUsername> {
  final _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Username"),
        actions: <Widget>[
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
            if (state is Authenticated) {
              return IconButton(
                icon: Icon(EvaIcons.checkmark),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    BlocProvider.of<AuthenticationBloc>(context).add(
                      UpdateUser(
                        user: state.user
                            .copyWith(username: _usernameController.text),
                      ),
                    );
                    Scaffold.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Username changed successfully.'),
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
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      validator: (username) {
                        final rule = Rule(
                          username,
                          name: "username",
                          isRequired: true,
                          minLength: 5,
                        );
                        return rule.hasError ? rule.error : null;
                      },
                      controller: _usernameController,
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: state.user.username,
                          labelText: "Edit username"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "You can choose a full name on Homy. If you do, other people will be able to see your name on products interactions.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "You can use a-z, 0-9 and underscores. Minimum length is 5.",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
