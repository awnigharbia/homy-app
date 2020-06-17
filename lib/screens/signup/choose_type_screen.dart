import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/blocs.dart';
import 'package:google_fonts/google_fonts.dart';

enum accountType { Customer, Trader }

class ChooseTypeScreen extends StatefulWidget {
  final String email;
  ChooseTypeScreen({Key key, @required this.email}) : super(key: key);

  @override
  _ChooseTypeScreenState createState() => _ChooseTypeScreenState();
}

class _ChooseTypeScreenState extends State<ChooseTypeScreen> {
  accountType _type = accountType.Customer;

  void _handleSelect(val) {
    setState(() {
      _type = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (_, state) {
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Color.fromRGBO(235, 87, 87, 1))),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: FractionalOffset.topLeft,
                child: Text(
                  "Choose account type:",
                  style: GoogleFonts.openSans(
                    fontSize: 20.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _handleSelect(accountType.Customer);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          FittedBox(
                            child: Image.asset(
                              "assets/customer.png",
                              width: 150.0,
                              height: 150.0,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: _type == accountType.Customer
                                    ? Color.fromRGBO(235, 87, 87, 0.65)
                                    : Color.fromRGBO(176, 176, 176, 0.65),
                                borderRadius: BorderRadius.circular(10)),
                            width: 155,
                            height: 150,
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                    value: accountType.Customer,
                                    groupValue: _type,
                                    activeColor: Color.fromRGBO(235, 87, 87, 1),
                                    onChanged: (val) {
                                      print(val);
                                    },
                                  ),
                                  Text(
                                    "Customer",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _handleSelect(accountType.Trader);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/trader.png",
                            width: 150.0,
                            height: 150.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: _type == accountType.Trader
                                    ? Color.fromRGBO(235, 87, 87, 0.65)
                                    : Color.fromRGBO(176, 176, 176, 0.65),
                                borderRadius: BorderRadius.circular(10)),
                            width: 155,
                            height: 150,
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                    value: accountType.Trader,
                                    groupValue: _type,
                                    activeColor: Color.fromRGBO(235, 87, 87, 1),
                                    onChanged: (val) {},
                                  ),
                                  Text(
                                    "Trader",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 60.0,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          side:
                              BorderSide(color: Color.fromRGBO(13, 18, 48, 0))),
                      color: Color.fromRGBO(235, 87, 87, 1),
                      onPressed: () {
                        BlocProvider.of<RegisterBloc>(context)
                            .add(CompleteRegistration(
                          email: widget.email,
                          username: widget.email,
                          userRole: _type == accountType.Customer
                              ? 'Customer'
                              : 'Trader',
                        ));
                      },
                      child: Text(
                        "Next",
                        style: GoogleFonts.openSans(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
