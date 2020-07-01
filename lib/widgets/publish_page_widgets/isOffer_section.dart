import 'package:flutter/material.dart';
import 'package:rules/rules.dart';

class IsOfferSection extends StatefulWidget {
  final TextEditingController controller;
  IsOfferSection({Key key, this.controller}) : super(key: key);

  @override
  _IsOfferSectionState createState() => _IsOfferSectionState();
}

class _IsOfferSectionState extends State<IsOfferSection> {
  bool isOffer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Offer",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
            Switch(
              onChanged: (value) {
                setState(() {
                  isOffer = value;
                });
              },
              value: isOffer,
            ),
          ],
        ),
        isOffer
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Offer percentage",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.29,
                    child: TextFormField(
                      controller: widget.controller,
                      validator: (offerPrice) {
                        final rule = Rule(
                          offerPrice,
                          name: "OfferPrice",
                          isRequired: false,
                          isNumeric: true,
                          greaterThanEqualTo: 0,
                        );

                        return rule.hasError ? rule.error : null;
                      },
                      decoration: InputDecoration(
                        hintText: "offer %",
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
              )
            : SizedBox(),
      ],
    );
  }
}
