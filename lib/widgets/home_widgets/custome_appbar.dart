import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentSearch {
  String topic;
  Icon icon;

  RecentSearch({this.topic, this.icon});

  String getTopic() {
    return this.topic;
  }

  Icon getIcon() {
    return this.icon;
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Gaza",
    "Rafah",
    "Dier Al-balah",
    "Al-remal",
    "Sheikh-redwan"
  ];

  final List<RecentSearch> recentSearch = [
    RecentSearch(
      topic: "Shop",
      icon: Icon(EvaIcons.shoppingCartOutline),
    ),
    RecentSearch(
      topic: "Collection",
      icon: Icon(Icons.collections),
    ),
    RecentSearch(
      topic: "Offer",
      icon: Icon(EvaIcons.pricetagsOutline),
    ),
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSearch
        : cities.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: recentSearch[index].getIcon(),
            title: RichText(
              text: TextSpan(
                text: recentSearch[index].getTopic().substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  letterSpacing: 1.0,
                ),
                children: [
                  TextSpan(
                    text:
                        recentSearch[index].getTopic().substring(query.length),
                    style: GoogleFonts.openSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 2.0, // has the effect of softening the shadow
                  spreadRadius: 0.0, // has the effect of extending the shadow
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    0.0, // vertical, move down 10
                  ),
                )
              ],
              color: Colors.white),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black54,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Expanded(
                child: FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  child: Text(
                    "Search for products & offers",
                    style: GoogleFonts.openSans(
                      fontSize: 16.0,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.black54,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/settings");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
