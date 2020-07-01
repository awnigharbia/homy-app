import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/user_widgets/typeBox.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/shopRegister_bloc/bloc.dart';
import 'package:shop_repository/shop_repository.dart';

class SettingsStoreType extends StatefulWidget {
  final Shop shop;
  SettingsStoreType({Key key, this.shop}) : super(key: key);

  @override
  _SettingsStoreTypeState createState() => _SettingsStoreTypeState();
}

class _SettingsStoreTypeState extends State<SettingsStoreType> {
  final _formKey = GlobalKey<FormState>();
  ShopCategories _categories;

  @override
  void initState() {
    super.initState();
    _categories = convertStringToType(widget.shop.shopType);
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

  static ShopCategories convertStringToType(String type) {
    switch (type) {
      case "Food and Drink":
        return ShopCategories.FoodAndDrink;
        break;
      case "Cloths and Shoes":
        return ShopCategories.ClothsAndShoes;
        break;
      case "Fashion and Style":
        return ShopCategories.FashionAndStyle;
        break;
      case "Technology and Communication":
        return ShopCategories.TechnologyAndCommunication;
        break;
    }
  }

  void changeCategory(ShopCategories value) {
    setState(() {
      _categories = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit store type"),
        actions: <Widget>[
          BlocListener<ShopRegisterBloc, ShopRegisterState>(
            listener: (context, state) {
              if (state.isUpdateSuccess) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Store type changed successfully.'),
                          Icon(
                            EvaIcons.checkmarkCircle2,
                            color: Colors.green[800],
                          ),
                        ],
                      ),
                    ),
                  );
              }
            },
            child: IconButton(
                icon: Icon(EvaIcons.checkmark),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    BlocProvider.of<ShopRegisterBloc>(context).add(
                      UpdateShop(
                        shop: widget.shop.copyWith(
                            shopType: convertTypeToString(_categories)),
                      ),
                    );
                  }
                }),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
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
              category: ShopCategories.TechnologyAndCommunication,
              changeCategory: changeCategory,
            ),
          ],
        ),
      ),
    );
  }
}
