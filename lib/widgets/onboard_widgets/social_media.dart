import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaLink extends StatelessWidget {
  final VoidCallback googleCallback;
  final bool isFocused;
  const SocialMediaLink({Key key, this.isFocused, this.googleCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isFocused ? 0 : 1,
      duration: Duration(milliseconds: 300),
      child: AnimatedContainer(
        height: isFocused ? 0.0 : MediaQuery.of(context).size.height * 0.18,
        transform: isFocused
            ? Matrix4.translationValues(0, -300, -5)
            : Matrix4.translationValues(0, 0, 0),
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 9,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                child: FlatButton(
                  color: Color.fromRGBO(64, 100, 172, 1),
                  onPressed: () {
                    print("Facebook");
                  },
                  child: Text(
                    "Facebook",
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 9,
              child: Row(children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                    child: FlatButton(
                      color: Color.fromRGBO(52, 209, 247, 1),
                      onPressed: () {
                        print("Facebook");
                      },
                      child: Text(
                        "Twitter",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                    child: FlatButton(
                      color: Color.fromRGBO(212, 66, 53, 1),
                      onPressed: googleCallback,
                      child: Text(
                        "Google",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
