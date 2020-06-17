import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/user_widgets/typeBox.dart';

class SettingsStoreType extends StatelessWidget {
  ShopCategories _categories = ShopCategories.FoodAndDrink;
  bool active = false;

  void changeCategory(ShopCategories value) {
    // setState(() {
    //   _categories = value;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit store type"),
        actions: <Widget>[
          Icon(EvaIcons.checkmark),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TypeBox(
            name: "Food & Drink",
            url: "assets/food.png",
            active: true,
            categories: _categories,
            category: ShopCategories.FoodAndDrink,
          ),
          TypeBox(
            name: "Cloths & Shoes",
            url: "assets/clothes.png",
            active: false,
            categories: _categories,
            category: ShopCategories.ClothsAndShoes,
          ),
          TypeBox(
            name: "Fashion & Style",
            url: "assets/makeup.png",
            active: false,
            categories: _categories,
            category: ShopCategories.FashionAndStyle,
          ),
          TypeBox(
            name: "Technology & Communication",
            url: "assets/wireless-router.png",
            active: false,
            categories: _categories,
            category: ShopCategories.TechonologyAndCommunication,
          ),
        ],
      ),
    );
  }
}
