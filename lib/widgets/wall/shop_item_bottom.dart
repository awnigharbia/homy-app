import 'package:flutter/material.dart';

class ShopItemBottom extends StatelessWidget {
  const ShopItemBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              "https://images.unsplash.com/photo-1490126125528-a0c3b2998dcd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              "https://images.unsplash.com/photo-1505253827648-b4de98bc66b4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=329&q=80",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              "https://images.unsplash.com/photo-1576365503602-7327d056d159?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=376&q=80",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
