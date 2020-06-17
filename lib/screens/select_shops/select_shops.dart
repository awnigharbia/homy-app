import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

enum Options { copyUrl, reportURL }

class SelectShops extends StatelessWidget {
  const SelectShops({Key key}) : super(key: key);

  Widget shopBox() {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 5.0,
            spreadRadius: 5.0,
            offset: Offset(
              0.0,
              0.0,
            ),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: 70,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.network(
                "https://images.unsplash.com/photo-1564227503787-ad186f508e6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=401&q=80",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                "Al-Jayyar shop",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "300 ",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "posts   ",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text: "3k ",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "followers",
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  )
                ]),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (int index) => Icon(
                    EvaIcons.star,
                    size: 16.0,
                    color: Colors.yellow[400],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                height: 30.0,
                child: FlatButton(
                  onPressed: () {
                    print("follow");
                  },
                  color: Colors.redAccent,
                  child: Text(
                    "Follow",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          "Select Shops",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          PopupMenuButton(
            tooltip: "Filter",
            padding: EdgeInsets.zero,
            icon: Icon(EvaIcons.funnelOutline),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              PopupMenuItem(
                height: 40,
                value: Options.copyUrl,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: true,
                        onChanged: (bool newValue) {
                          print("changed");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Random",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                height: 40,
                value: Options.copyUrl,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: false,
                        onChanged: (bool newValue) {
                          print("changed");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Cloths & Shoes")
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                height: 40,
                value: Options.copyUrl,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: false,
                        onChanged: (bool newValue) {
                          print("changed");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Food and drink")
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                height: 40,
                value: Options.copyUrl,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: false,
                        onChanged: (bool newValue) {
                          print("changed");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Fashion & Style")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: GridView.count(
        padding: EdgeInsets.all(16.0),
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: <Widget>[
          shopBox(),
          shopBox(),
          shopBox(),
          shopBox(),
          shopBox(),
          shopBox(),
          shopBox(),
          shopBox(),
        ],
      ),
    );
  }
}
