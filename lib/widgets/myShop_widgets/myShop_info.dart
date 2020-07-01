import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/utils/slideLeftRoute.dart';

class MyShopInfo extends StatelessWidget {
  const MyShopInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Authenticated)
          return SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                contentPadding: EdgeInsets.only(left: 16.0),
                leading: Icon(EvaIcons.phoneOutline),
                title: Text(
                  state.shop.shopPhone,
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      SlideLeftRoute(
                        widget: SettingsStorePhone(
                          shop: state.shop,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                contentPadding: EdgeInsets.only(left: 16.0),
                title: Text(state.shop.shopLocation),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      SlideLeftRoute(
                        widget: SettingsStoreLocation(
                          shop: state.shop,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
              ),
              ListTile(
                leading: Icon(EvaIcons.shoppingCartOutline),
                contentPadding: EdgeInsets.only(left: 16.0),
                title: Text(state.shop.shopType),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      SlideLeftRoute(
                        widget: SettingsStoreType(shop: state.shop),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
              ),
              ListTile(
                leading: Icon(EvaIcons.infoOutline),
                contentPadding: EdgeInsets.only(left: 16.0),
                title: Text(
                  state.shop.shopDescription,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      SlideLeftRoute(
                        widget: SettingsStoreDescription(
                          shop: state.shop,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
              ),
            ]),
          );
      },
    );
  }
}
