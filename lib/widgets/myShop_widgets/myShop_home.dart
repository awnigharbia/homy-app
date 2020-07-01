import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';
import 'package:shop_repository/shop_repository.dart';

class MyShopHomeTab extends StatelessWidget {
  const MyShopHomeTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is Authenticated)
        return BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
            shopRepository: FirebaseShopRepository(),
          )..add(
              LoadProduct(uid: state.user.id),
            ),
          child: MyShopHomeTabProvided(shop: state.shop, uid: state.user.id),
        );

      return SizedBox();
    });
  }
}

class MyShopHomeTabProvided extends StatelessWidget {
  final Shop shop;
  final String uid;
  const MyShopHomeTabProvided({Key key, this.shop, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          MyShopHomeFollowers(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
              onPressed: () {
                print("follow");
              },
              color: Colors.redAccent,
              child: Text(
                "Edit info",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              "Top offers",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: const EdgeInsets.only(left: 16.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                OfferCollection(
                  title: "Collection of 2020",
                  discount: 20,
                ),
                OfferCollection(
                  title: "Collection of 2019",
                  discount: 40,
                ),
                OfferCollection(
                  title: "Collection of 2018",
                  discount: 50,
                ),
                OfferCollection(
                  title: "Collection of 2017",
                  discount: 60,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              "Recent posts",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoaded) {
                return Container(
                  padding:
                      const EdgeInsets.only(left: 14.0, top: 16.0, right: 14.0),
                  child: Column(
                    children: state.products
                        .map(
                          (e) => MyShopPost(
                            uid: uid,
                            product: e,
                            shopName: shop.shopName,
                            shopType: shop.shopType,
                          ),
                        )
                        .toList(),
                  ),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
