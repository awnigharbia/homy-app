import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool active;
  const Category({Key key, this.title, this.icon, this.active = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      margin: const EdgeInsets.only(right: 10),
      decoration: new BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            icon != null
                ? Icon(
                    icon,
                    color: Colors.black,
                    size: 20.0,
                  )
                : Text(""),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                  letterSpacing: 1.3),
            ),
          ],
        ),
      ),
    );
  }
}
