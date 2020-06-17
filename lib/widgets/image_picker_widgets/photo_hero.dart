import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoHeroImagePicker extends StatelessWidget {
  const PhotoHeroImagePicker(
      {Key key, this.photo, this.onTap, this.width, this.scale = false})
      : super(key: key);

  final ImageProvider<dynamic> photo;
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
              imageProvider: photo,
              minScale: 0.5,
              maxScale: 2.0,
            )
          : Hero(
              tag: photo,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: photo),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
