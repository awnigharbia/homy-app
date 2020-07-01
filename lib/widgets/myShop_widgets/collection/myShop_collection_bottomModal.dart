import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

void bottomModal(context, showCollectionDialouge) async {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        // height: 200,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Text(
                "Choose collection photo's",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showCollectionDialouge('local');
              },
              leading: Icon(EvaIcons.imageOutline),
              title: Text(
                "Upload from gallery",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showCollectionDialouge('remote');
              },
              leading: Icon(
                Icons.collections,
              ),
              title: Text(
                "Choose from Homy photo's",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
