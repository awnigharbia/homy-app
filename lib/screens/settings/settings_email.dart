import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SettingsEmail extends StatelessWidget {
  const SettingsEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit email address"),
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
              decoration: InputDecoration(hintText: 'Edit email'),
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
}
