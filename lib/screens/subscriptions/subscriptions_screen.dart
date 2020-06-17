import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class StoreInfo {
  String name;
  String image;

  StoreInfo(this.name, this.image);
}

class SubscriptionsScreen extends StatelessWidget {
  final List<StoreInfo> listOfStores = [
    StoreInfo("Shroud",
        "https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
    StoreInfo("Shroud",
        "https://images.unsplash.com/photo-1546213290-e1b492ab3eee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80"),
    StoreInfo("Shroud",
        "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
    StoreInfo("Shroud",
        "https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
    StoreInfo("Shroud",
        "https://images.unsplash.com/photo-1546213290-e1b492ab3eee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80"),
    StoreInfo("Shroud",
        "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
    StoreInfo("Shroud",
        "https://images.unsplash.com/photo-1472851294608-062f824d29cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
    StoreInfo("Shroud",
        "https://images.unsplash.com/photo-1546213290-e1b492ab3eee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80"),
    StoreInfo("Shroud",
        "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
  ];

  Widget storeIcon({name, image}) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 13.0, color: Colors.black54),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Your shops",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "View all",
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Icon(EvaIcons.arrowIosForwardOutline)
                ],
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          child: ListView.builder(
            padding: EdgeInsets.all(15.0),
            scrollDirection: Axis.horizontal,
            itemCount: listOfStores.length,
            itemBuilder: (context, index) {
              return storeIcon(
                  name: listOfStores[index].name,
                  image: listOfStores[index].image);
            },
          ),
        ),
        Container(
            padding: const EdgeInsets.only(left: 14.0, top: 16.0, right: 14.0),
            child: Column(
              children: <Widget>[
                ShopPost(
                  isCollection: false,
                  image:
                      "https://images.unsplash.com/photo-1512374382149-233c42b6a83b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80",
                ),
                ShopPost(
                  isCollection: true,
                  image:
                      "https://images.unsplash.com/photo-1531310197839-ccf54634509e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=401&q=80",
                ),
                ShopPost(
                  isCollection: false,
                  image:
                      "https://images.unsplash.com/photo-1532471965572-092fb677a6a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
                ),
              ],
            ),
          ),
        
      ],
    );
  }
}
