import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key key, this.photo, this.onTap, this.width, this.scale = false})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final bool scale;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: scale
          ? PhotoView(
              heroAttributes: PhotoViewHeroAttributes(tag: photo),
              backgroundDecoration: BoxDecoration(color: Colors.black),
              imageProvider: NetworkImage(photo),
              minScale: 0.5,
              maxScale: 2.0,
            )
          : Hero(
              tag: photo,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Image.network(photo, fit: BoxFit.cover)),
                ),
              ),
            ),
    );
  }
}
