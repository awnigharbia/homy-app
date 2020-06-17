import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SettingsName extends StatelessWidget {
  const SettingsName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Name"),
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
              decoration: InputDecoration(hintText: 'Edit your full name'),
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
}
