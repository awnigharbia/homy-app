import 'package:flutter/material.dart';

ScaffoldState showSnackbar(context, message, icon, iconColor) {
  return Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor),
            Text(message),
          ],
        ),
      ),
    );
}
