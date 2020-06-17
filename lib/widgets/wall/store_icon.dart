import 'package:flutter/material.dart';

class StoreIcon extends StatelessWidget {
  final String name;
  final String image;
  const StoreIcon({Key key, this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/storyView");
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.0),
        child: Stack(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: Colors.redAccent,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 45,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12.5),
                ),
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 65,
              child: Text(
                name,
                style: TextStyle(fontSize: 13.0, color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}
