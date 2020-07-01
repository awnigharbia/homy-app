import 'package:flutter/material.dart';
import 'package:rules/rules.dart';

class PriceSection extends StatefulWidget {
  final TextEditingController controller;
  PriceSection({Key key, this.controller}) : super(key: key);

  @override
  _PriceSectionState createState() => _PriceSectionState();
}

class _PriceSectionState extends State<PriceSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Product Price",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.29,
          child: TextFormField(
            controller: widget.controller,
            validator: (price) {
              final rule = Rule(
                price,
                name: "price",
                isRequired: false,
                isNumeric: true,
                greaterThanEqualTo: 0,
              );
              return rule.hasError ? rule.error : null;
            },
            decoration: InputDecoration(
              hintText: "Enter price ₪",
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
