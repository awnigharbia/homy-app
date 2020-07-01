import 'package:flutter/material.dart';
import 'package:rules/rules.dart';

class InStockSection extends StatefulWidget {
  final TextEditingController controller;
  InStockSection({Key key, this.controller}) : super(key: key);

  @override
  _InStockSectionState createState() => _InStockSectionState();
}

class _InStockSectionState extends State<InStockSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "In Stock",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: TextFormField(
            controller: widget.controller,
            validator: (inStock) {
              final rule = Rule(inStock,
                  name: "InStock",
                  isRequired: false,
                  isNumeric: true,
                  greaterThanEqualTo: 0);
              return rule.hasError ? rule.error : null;
            },
            decoration: InputDecoration(
              hintText: "Enter total",
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            keyboardType: TextInputType.number,
          ),
        )
      ],
    );
  }
}
