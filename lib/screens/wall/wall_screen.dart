import 'package:carousel_slider/carousel_slider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class WallScreen extends StatelessWidget {
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
  final List<String> names = [
    "Al Helo Shop",
    "Al Jayyar Shop",
    "Metro shop",
    "Al-Dar resturant"
  ];
  WallScreen({Key key}) : super(key: key);

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          child: TrendingItem(
            name: "Shop No ${imgList.indexOf(item)}",
            img: item,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Latest updates",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/selectShops");
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Icon(
                                EvaIcons.plus,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "add shop",
                            style: TextStyle(
                                fontSize: 13.0, color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return StoreIcon(
                    name: listOfStores[index].name,
                    image: listOfStores[index].image);
              },
            ),
          ),
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 1,
                initialPage: 2,
                autoPlay: false,
                height: 300,
              ),
              items: imageSliders,
            ),
          ),
          OfferSection(),
          ShopSection(
            title: "Food & drink shops",
          ),
          RandomProducts(
            title: "Cloths products",
            products: [
              RandomProduct(
                  image:
                      "https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80"),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
              ),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1503341504253-dff4815485f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
              ),
            ],
          ),
          ShopSection(
            title: "Shoes & Cloths shops",
          ),
          RandomProducts(
            title: "Shoes products",
            products: [
              RandomProduct(
                  image:
                      "https://images.unsplash.com/photo-1543508282-6319a3e2621f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=358&q=80"),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1518002171953-a080ee817e1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
              ),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
              ),
              RandomProduct(
                  image:
                      "https://images.unsplash.com/photo-1543508282-6319a3e2621f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=358&q=80"),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1518002171953-a080ee817e1f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
              ),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
              ),
            ],
          ),
          RandomProducts(
            title: "Cloths products",
            products: [
              RandomProduct(
                  image:
                      "https://images.unsplash.com/photo-1565548058654-6ba93b5e3135?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80"),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1571455786673-9d9d6c194f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
              ),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1503341504253-dff4815485f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80",
              ),
            ],
          ),
          ShopSection(
            title: "Fashion & Style shops",
          ),
          RandomProducts(
            title: "Fashion products",
            products: [
              RandomProduct(
                  image:
                      "https://images.unsplash.com/photo-1562887245-f2d5024f6134?ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80"),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=375&q=80",
              ),
              RandomProduct(
                image:
                    "https://images.unsplash.com/photo-1562887284-8ba6b7c90fd8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
              ),
            ],
          ),
          ShopSection(
            title: "Electronic & Mechanics shops",
          ),
        ],
      ),
    );
  }
}
