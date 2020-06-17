import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomBackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Color.fromRGBO(246, 246, 246, 0.95);
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    // starting from the 20% of the height
    ovalPath.moveTo(0, height * 0.3);
    ovalPath.quadraticBezierTo(
        width * 0.45, height * 0.25, width * 0.51, height * 0.5);

    //
    ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width, height);

    //
    ovalPath.lineTo(0, height);
    ovalPath.close();

    paint.color = Color.fromRGBO(240, 240, 240, 1);
    canvas.drawPath(ovalPath, paint);

    // set the color property of the paint
    paint.color = Color.fromRGBO(236, 236, 236, 1);
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width * 0.9, size.height / 5);

    // draw the circle on centre of canvas having radius 75.0
    canvas.drawCircle(center, 75.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class CustomBackground extends StatelessWidget {
  final Widget child;
  const CustomBackground({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new ExactAssetImage('assets/pattern.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child:
            Container(color: Color.fromRGBO(246, 246, 246, 0.975), child: child),
      ),
    );
  }
}
