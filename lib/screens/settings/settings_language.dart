import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SettingsLanguage extends StatelessWidget {
  final bool active = false;
  const SettingsLanguage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose language"),
        actions: <Widget>[
          Icon(EvaIcons.checkmark),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: SizedBox(
                width: 30,
                height: 30,
                child: Image.network(
                    "https://image.flaticon.com/icons/png/512/330/330459.png"),
              ),
              title: Text("English"),
              onTap: () {},
              subtitle: Text("USA"),
              trailing: Icon(
                EvaIcons.checkmark,
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              leading: SizedBox(
                width: 30,
                height: 30,
                child: Image.network(
                    "https://image.flaticon.com/icons/png/512/330/330477.png"),
              ),
              title: Text("Arabic"),
              onTap: () {},
              subtitle: Text("EGYPT"),
              trailing: active ? Icon(EvaIcons.checkmark) : null,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
