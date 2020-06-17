import 'package:flutter/material.dart';

class CustomBackgroundAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  const CustomBackgroundAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: appBarHeight, left: 16),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  "https://images.unsplash.com/photo-1577919518833-57dc0a0105e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=336&q=80",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Awni Gharbia",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Customer",
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
