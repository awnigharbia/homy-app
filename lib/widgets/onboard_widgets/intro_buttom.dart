import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/blocs.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroButton extends StatelessWidget {
  final int currentPage;
  final int numPages;
  final PageController pageController;

  const IntroButton(
      {Key key,
      @required this.currentPage,
      @required this.numPages,
      @required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 45.0,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Color.fromRGBO(235, 87, 87, 1),
              onPressed: () {
                BlocProvider.of<OnBoardBloc>(context).add(MyEvent.RegisterPage);
              },
              child: Text(
                "Register",
                style: GoogleFonts.openSans(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 45.0,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Colors.blueGrey,
              onPressed: () {
                BlocProvider.of<OnBoardBloc>(context).add(MyEvent.LoginPage);
                // Navigator.of(context, rootNavigator: true).push(
                //   SlideLeftRoute(
                //     widget: LoginScreen(),
                //   ),
                // );
              },
              child: Text(
                "Login",
                style: GoogleFonts.openSans(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
