import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

typedef SetValue = Function(String task);

class SectionDropdown extends StatefulWidget {
  final String value;
  final SetValue setValue;
  SectionDropdown({Key key, this.value, this.setValue}) : super(key: key);

  @override
  _SectionDropdownState createState() => _SectionDropdownState();
}

class _SectionDropdownState extends State<SectionDropdown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Section",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
        DropdownButton<String>(
          value: widget.value,
          icon: Icon(EvaIcons.arrowIosDownwardOutline),
          iconSize: 24,
          elevation: 16,
          underline: Container(
            height: 0,
          ),
          onChanged: (String newValue) {
            widget.setValue(newValue);
          },
          items: <String>['All', 'section 2', 'section 3', 'section 4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
