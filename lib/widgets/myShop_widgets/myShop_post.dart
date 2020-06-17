import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../widgets.dart';

class MyShopPost extends StatelessWidget {
  final bool isCollection;
  final String image;
  const MyShopPost({Key key, this.image, this.isCollection}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Al Hello Shop",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text("fashion and style",
                          style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
                width: 35,
                height: 35,
                child: PopupMenuButton(
                  tooltip: "Options",
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  icon: Icon(EvaIcons.moreHorizotnalOutline),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Options>>[
                    PopupMenuItem(
                      height: 50,
                      value: Options.copyUrl,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(EvaIcons.edit, color: Color.fromRGBO(0, 0, 0, 0.8)),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Edit product")
                          ],
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      height: 50,
                      value: Options.copyUrl,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Icon(EvaIcons.trash2Outline, color: Color.fromRGBO(0, 0, 0, 0.8)),
                            SizedBox(width: 10),
                            Text("Delete Product")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: isCollection
                ? Container(
                    height: 400,
                    child: Swiper(
                      pagination: new SwiperPagination(),
                      indicatorLayout: PageIndicatorLayout.COLOR,
                      itemCount: images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(image, fit: BoxFit.cover),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red[100],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          EvaIcons.heart,
                          color: Colors.redAccent,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Like",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.0,
                              color: Colors.redAccent),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          EvaIcons.bookmarkOutline,
                          color: Colors.black45,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Save",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.0,
                              color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          EvaIcons.paperPlaneOutline,
                          color: Colors.black45,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                            color: Colors.black45,
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          ),
          RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: "Al Helo Shop",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextSpan(
                  text:
                      " is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                  style: TextStyle(color: Colors.black45))
            ]),
          ),
        ],
      ),
    );
  }
}
