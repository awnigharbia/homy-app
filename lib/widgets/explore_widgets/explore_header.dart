import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ExploreHeader extends StatelessWidget {
  final int index;
  final String title;
  final bool isHeart;
  const ExploreHeader({Key key, this.index, this.title, this.isHeart = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      stretch: true,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.45,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title),
        background: Swiper(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) => PhotoHero(
            photo: "https://picsum.photos/500?random=$index",
            width: double.infinity,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        elevation: 0.0,
                        backgroundColor: Colors.black,
                        actions: <Widget>[
                          Icon(EvaIcons.downloadOutline),
                          SizedBox(
                            width: 20.0,
                          ),
                          Icon(
                            EvaIcons.heartOutline,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                        ],
                      ),
                      body: Container(
                        color: Colors.black,
                        child: Center(
                          child: PhotoHero(
                            photo: "https://picsum.photos/500?random=$index",
                            scale: true,
                            width: double.infinity,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          autoplay: false,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.share,
          ),
          onPressed: () {},
          tooltip: 'Share',
        ),
      ],
    );
  }
}
