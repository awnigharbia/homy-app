import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';

class MyShopHomeFollowers extends StatelessWidget {
  const MyShopHomeFollowers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is Authenticated)
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: state.shop.product != null
                    ? "${state.shop.product.length} "
                    : "0 ",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "posts          ",
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
              TextSpan(
                text: state.shop.shopFollowers != null ? "${state.shop.shopFollowers.length} " : "0 ",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "people following your shop",
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              )
            ]),
          ),
        );
    });
  }
}
