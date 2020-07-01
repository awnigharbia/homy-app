import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';

class MyShopHeaderDetails extends StatelessWidget {
  const MyShopHeaderDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Authenticated)
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                state.shop.shopName,
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                state.shop.shopType,
                style: TextStyle(fontSize: 8),
              ),
              SizedBox(height: 2.0),
              Row(
                children: List.generate(
                  5,
                  (int index) => Icon(
                    EvaIcons.star,
                    size: 10.0,
                    color: Colors.yellow[400],
                  ),
                ),
              )
            ],
          );
      },
    );
  }
}
