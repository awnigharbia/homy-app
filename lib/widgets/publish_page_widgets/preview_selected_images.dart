import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class PreviewSelectedImages extends StatelessWidget {
  final List<AssetEntity> selectedImages;
  const PreviewSelectedImages({Key key, this.selectedImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        scrollDirection: Axis.horizontal,
        children: selectedImages
            .asMap()
            .map(
              (index, image) => MapEntry(
                index,
                FutureBuilder(
                  future: image.originBytes,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SizedBox(
                          width: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.memory(
                              snapshot.data,
                              fit: BoxFit.cover,
                              scale: 5,
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
