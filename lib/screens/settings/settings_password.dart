import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SettingsPassword extends StatelessWidget {
  const SettingsPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit password"),
        actions: <Widget>[
          Icon(EvaIcons.checkmark),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'Old password'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'New password'),
            ),
             SizedBox(
              height: 10.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Confirm password'),
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
    );
  }
}
