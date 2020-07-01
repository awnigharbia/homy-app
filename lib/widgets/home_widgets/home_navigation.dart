import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/utils/slideLeftRoute.dart';

final List<Widget> customerScreens = <Widget>[
  WallScreen(),
  ExploreScreen(),
  SubscriptionsScreen(),
  NotificationScreen(),
];

final List<Widget> traderScreens = <Widget>[
  WallScreen(),
  ExploreScreen(),
  NotificationScreen(),
  MyShopScreen(),
];

class HomeNavigation extends StatefulWidget {
  final String userRole;
  final List<BottomNavigationBarItem> myNavigation;
  HomeNavigation({Key key, this.myNavigation, this.userRole}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Visibility(
          visible: widget.userRole != 'Customer',
          child: FloatingActionButton(
            shape: StadiumBorder(),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ImagePick(
                        maxSelect: 10,
                        callback: () {
                          Navigator.push(
                            context,
                            SlideLeftRoute(
                              widget: PublishPage(),
                            ),
                          );
                        },
                      )));
            },
            backgroundColor: Colors.redAccent,
            child: Icon(
              EvaIcons.plusOutline,
              size: 25.0,
            ),
          ),
        ),
        body: widget.userRole == 'Customer'
            ? customerScreens.elementAt(_selectedIndex)
            : traderScreens.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: widget.myNavigation,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          selectedIconTheme: IconThemeData(color: Colors.redAccent),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          iconSize: 26.0,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
