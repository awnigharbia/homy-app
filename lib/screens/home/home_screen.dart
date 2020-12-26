import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/widgets/home_widgets/custome_appbar.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  HomeScreen({Key key, @required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // final bool isTrader = true;
  final List<BottomNavigationBarItem> customerNavigation =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(EvaIcons.homeOutline),
      activeIcon: Icon(EvaIcons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(EvaIcons.compassOutline),
      activeIcon: Icon(EvaIcons.compass),
      label: "Explore",
    ),
    BottomNavigationBarItem(
      icon: Icon(EvaIcons.shoppingBagOutline),
      activeIcon: Icon(EvaIcons.shoppingBag),
      label: "Subscriptions",
    ),
    BottomNavigationBarItem(
      icon: Icon(EvaIcons.bellOutline),
      activeIcon: Icon(EvaIcons.bell),
      label: "Notifications",
    ),
  ];

  // Trader tabs
  final List<BottomNavigationBarItem> traderNavigation =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(EvaIcons.homeOutline),
      activeIcon: Icon(EvaIcons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(EvaIcons.compassOutline),
      activeIcon: Icon(EvaIcons.compass),
      label: "Explore",
    ),
    BottomNavigationBarItem(
      icon: Icon(EvaIcons.bellOutline),
      activeIcon: Icon(EvaIcons.bell),
      label: "Notifications",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.store),
      label: "My Shop",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: HomeDrawer(controller: null),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (_, state) {
          if (state is Authenticated) {
            return SafeArea(
              child: Column(
                children: <Widget>[
                  CustomAppBar(),
                  Expanded(
                    child: HomeNavigation(
                      userRole: state.user.userRole,
                      myNavigation: state.user.userRole == 'Customer'
                          ? customerNavigation
                          : traderNavigation,
                    ),
                  ),
                ],
              ),
            );
          }

          // TODO1: Handle unauthenticated scene
          return Text("Not Authenticated");
        }),
      ),
    );
  }
}
