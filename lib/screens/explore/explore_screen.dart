import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class ExploreScreen extends StatelessWidget {
  final Tab myTabs;
  const ExploreScreen({Key key, this.myTabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      appBar: null,
      body: Column(
        children: <Widget>[
          Container(
            height: 55,
            child: ListView(
              padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Category(
                    title: "Trending", icon: Icons.trending_up, active: true),
                Category(title: "Offers", icon: Icons.local_offer),
                Category(title: "Shoes"),
                Category(title: "Food"),
                Category(title: "Fashion"),
                Category(title: "Cloths"),
                Category(title: "Electornics"),
              ],
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              itemCount: 80,
              itemBuilder: (BuildContext context, int index) => PhotoHero(
                photo: "https://picsum.photos/500?random=$index",
                scale: false,
                width: 300.0,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          floatingActionButton: FloatingActionButton(
                            onPressed: () {},
                            child: Icon(EvaIcons.heart),
                            backgroundColor: Colors.redAccent,
                          ),
                          body: CustomScrollView(
                            slivers: <Widget>[
                              ExploreHeader(
                                index: index,
                                title: "Dark Night shoes",
                                isHeart: true,
                              ),
                              SliverList(
                                delegate: SliverChildListDelegate(
                                  [
                                    ExploreItemInfo(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              staggeredTileBuilder: (int index) => new StaggeredTile.count(
                  index % 12 == 0 ? 2 : 1, index % 12 == 0 ? 2 : 1),
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}

// "https://picsum.photos/400?random=$index"
