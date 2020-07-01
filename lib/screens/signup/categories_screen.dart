import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/create_shop_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/shopRegister_bloc/bloc.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

enum ShopCategories {
  FoodAndDrink,
  ClothsAndShoes,
  FashionAndStyle,
  TechnologyAndCommunication,
}

class ChooseCategoriesScreen extends StatefulWidget {
  final String shopName;
  final String shopDescription;
  final String shopPhone;
  final String shopLocation;
  ChooseCategoriesScreen({
    Key key,
    this.shopName,
    this.shopDescription,
    this.shopPhone,
    this.shopLocation,
  }) : super(key: key);

  @override
  _ChooseCategoriesScreenState createState() => _ChooseCategoriesScreenState();
}

String convertTypeToString(ShopCategories type) {
  switch (type) {
    case ShopCategories.FoodAndDrink:
      return "Food and Drink";
      break;
    case ShopCategories.ClothsAndShoes:
      return "Cloths and Shoes";
      break;
    case ShopCategories.FashionAndStyle:
      return "Fashion and Style";
      break;
    case ShopCategories.TechnologyAndCommunication:
      return "Technology and Communication";
      break;
  }
}

class _ChooseCategoriesScreenState extends State<ChooseCategoriesScreen> {
  ShopCategories _categories = ShopCategories.FoodAndDrink;
  // final bool active = false;

  void changeCategory(ShopCategories value) {
    setState(() {
      _categories = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(EvaIcons.arrowBackOutline),
          onPressed: () {
            BlocProvider.of<CreateShopBloc>(context).add(
              MyEvent.ShopRegisterPage,
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(235, 87, 87, 1),
        ),
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (_, user) {
          if (user is TraderRegisterShop) {
            return BlocListener<ShopRegisterBloc, ShopRegisterState>(
              listener: (context, state) {
                if (state.isSubmitting) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Saving shop info..'),
                            Icon(EvaIcons.alertTriangleOutline)
                          ],
                        ),
                        backgroundColor: Colors.yellow[800],
                      ),
                    );
                }
                if (state.isSuccess) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Shop register success.'),
                            Icon(EvaIcons.checkmarkCircle2)
                          ],
                        ),
                        backgroundColor: Colors.green[800],
                      ),
                    );
                  BlocProvider.of<AuthenticationBloc>(context)
                      .add(AppStarted());
                }

                if (state.isFailure) {
                  Scaffold.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Shop register failed.'),
                            Icon(Icons.error)
                          ],
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: FractionalOffset.topLeft,
                      child: Text(
                        "Choose your shop category",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      child: Expanded(
                        child: ListView(
                          children: <Widget>[
                            TypeBox(
                              name: "Food & Drink",
                              url: "assets/food.png",
                              active: true,
                              categories: _categories,
                              category: ShopCategories.FoodAndDrink,
                              changeCategory: changeCategory,
                            ),
                            TypeBox(
                              name: "Cloths & Shoes",
                              url: "assets/clothes.png",
                              active: false,
                              categories: _categories,
                              category: ShopCategories.ClothsAndShoes,
                              changeCategory: changeCategory,
                            ),
                            TypeBox(
                              name: "Fashion & Style",
                              url: "assets/makeup.png",
                              active: false,
                              categories: _categories,
                              category: ShopCategories.FashionAndStyle,
                              changeCategory: changeCategory,
                            ),
                            TypeBox(
                              name: "Technology & Communication",
                              url: "assets/wireless-router.png",
                              active: false,
                              categories: _categories,
                              category:
                                  ShopCategories.TechnologyAndCommunication,
                              changeCategory: changeCategory,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60.0,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: Color.fromRGBO(13, 18, 48, 0),
                          ),
                        ),
                        color: Color.fromRGBO(235, 87, 87, 1),
                        onPressed: () {
                          BlocProvider.of<ShopRegisterBloc>(context).add(
                            SaveShop(
                              ownerId: user.userId,
                              shopName: widget.shopName,
                              shopDescription: widget.shopDescription,
                              shopPhone: widget.shopPhone,
                              shopLocation: widget.shopLocation,
                              shopType: convertTypeToString(_categories),
                            ),
                          );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
