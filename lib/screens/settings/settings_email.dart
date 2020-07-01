import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:rules/rules.dart';

class SettingsEmail extends StatefulWidget {
  SettingsEmail({Key key}) : super(key: key);

  @override
  _SettingsEmailState createState() => _SettingsEmailState();
}

class _SettingsEmailState extends State<SettingsEmail> {
  final _emailAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit email address"),
        actions: <Widget>[
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
            if (state is Authenticated) {
              return IconButton(
                icon: Icon(EvaIcons.checkmark),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    BlocProvider.of<AuthenticationBloc>(context).add(
                      UpdateEmail(
                        user: state.user
                            .copyWith(email: _emailAddressController.text),
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
                              Text('Email address changed successfully.'),
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
                      validator: (email) {
                        final rule = Rule(
                          email,
                          name: "Email",
                          isRequired: true,
                          isEmail: true,
                        );

                        return rule.hasError ? rule.error : null;
                      },
                      autofocus: true,
                      controller: _emailAddressController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: state.user.email,
                          labelText: "Edit email address"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "You can choose a new email on Homy. If you do, other people will not be able to see your email on products interactions.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "You can use valid email address otherwise an error will occure.",
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
