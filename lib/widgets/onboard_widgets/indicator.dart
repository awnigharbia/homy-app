import 'package:flutter/material.dart';

class Indicators extends StatelessWidget {
  final int numPages;
  final int currentPage;
  const Indicators(
      {Key key, @required this.numPages, @required this.currentPage})
      : super(key: key);

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive
            ? Color.fromRGBO(235, 87, 87, 1)
            : Color.fromRGBO(235, 87, 87, 0.3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  List<Widget> buildPageIndicators() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buildPageIndicators(),
    );
  }
}
