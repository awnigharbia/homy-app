import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
      (i) => new IntSize((rnd.nextInt(500) + 200), rnd.nextInt(800) + 200));
}

class ShopCollection extends StatelessWidget {
  ShopCollection() : _sizes = _createSizes(_kItemCount).toList();

  static const int _kItemCount = 100;
  final List<IntSize> _sizes;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Collection 2019'),
        actions: <Widget>[
          Icon(EvaIcons.bookmarkOutline),
          SizedBox(
            width: 10.0,
          ),
          Icon(EvaIcons.shareOutline),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: new StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        itemBuilder: (context, index) => new _Tile(index, _sizes[index]),
        staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
      ),
    );
  }
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

class _Tile extends StatelessWidget {
  const _Tile(this.index, this.size);

  final IntSize size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: new Center(
                child: FancyShimmerImage(
                  imageUrl:
                      'https://picsum.photos/${size.width}/${size.height}/',
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, right: 5.0),
              child: Align(
                alignment: FractionalOffset.topRight,
                child: new Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        EvaIcons.eye,
                        size: 14.0,
                        color: Colors.white,
                      ),
                      Text(
                        " ${size.width}",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
