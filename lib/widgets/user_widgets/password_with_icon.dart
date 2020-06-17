import 'package:flutter/material.dart';

typedef OnChanged = dynamic Function(String);

class PasswordTextFieldWithIcon extends StatefulWidget {
  final TextEditingController controller;
  PasswordTextFieldWithIcon({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  _PasswordTextFieldWithIconState createState() =>
      _PasswordTextFieldWithIconState();
}

class _PasswordTextFieldWithIconState extends State<PasswordTextFieldWithIcon> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: TextField(
        controller: widget.controller,
        decoration: new InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.only(
            top: 14.0,
            bottom: 14,
            left: 20,
            right: 20,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          labelText: "Password",
          labelStyle: TextStyle(fontSize: 15.0),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
            icon: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
        obscureText: !_showPassword,
      ),
    );
  }
}
