import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

enum ShopCategories {
  FoodAndDrink,
  ClothsAndShoes,
  FashionAndStyle,
  TechonologyAndCommunication,
}

class ChooseCategoriesScreen extends StatefulWidget {
  ChooseCategoriesScreen({Key key}) : super(key: key);

  @override
  _ChooseCategoriesScreenState createState() => _ChooseCategoriesScreenState();
}

class _ChooseCategoriesScreenState extends State<ChooseCategoriesScreen> {
  ShopCategories _categories = ShopCategories.FoodAndDrink;
  final bool active = false;

  void changeCategory(ShopCategories value) {
    setState(() {
      _categories = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color.fromRGBO(235, 87, 87, 1))),
      body: Padding(
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
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60.0,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    side: BorderSide(color: Color.fromRGBO(13, 18, 48, 0))),
                color: Color.fromRGBO(235, 87, 87, 1),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
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
}
