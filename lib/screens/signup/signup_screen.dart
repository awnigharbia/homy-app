import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/blocs.dart';
import 'package:flutter_firestore_todos/blocs/register_bloc/register.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                BlocProvider.of<OnBoardBloc>(context).add(MyEvent.OnBoardPage);
              },
              icon: Icon(
                EvaIcons.arrowBackOutline,
              ),
            ),
            iconTheme:
                IconThemeData(color: Color.fromRGBO(235, 87, 87, 1), size: 200),
            backgroundColor: Colors.transparent,
            title: SvgPicture.asset("assets/homy.svg", height: 40),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: SignupForm(),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  SignupForm({Key key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  var userRole;
  bool isFocused;

  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _usernameController.addListener(_onUsernameChanged);

    KeyboardVisibility.onChange.listen((bool visible) {
      setState(() {
        isFocused = visible;
      });
    });
    isFocused = false;
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _usernameController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void _onEmailChanged() {
    _registerBloc.add(
      EmailChanged(
        email: _emailController.text,
      ),
    );
  }

  void _onUserRoleChanged(value) {
    setState(() {
      FocusScope.of(context).requestFocus(new FocusNode());
      userRole = value;
    });
    _registerBloc.add(UserRoleChanged(
      userRole: value,
    ));
  }

  void _onPasswordChanged() {
    _registerBloc.add(PasswordChanged(password: _passwordController.text));
  }

  void _onUsernameChanged() {
    _registerBloc.add(UsernameChanged(username: _usernameController.text));
  }

  void _onFormSubmitted() {
    _registerBloc.add(Submitted(
      email: _emailController.text,
      username: _usernameController.text,
      password: _passwordController.text,
      userRole: userRole,
    ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget textField({controller, keyboardType, label, validator, icon}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.grey[200],
            suffixIcon: icon,
            contentPadding: const EdgeInsets.only(
              top: 14.0,
              bottom: 14,
              left: 20,
              right: 20,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            // errorBorder: InputBorder.none,
            labelText: label,
            labelStyle: TextStyle(fontSize: 15.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Register Failure'), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }

        if (state.isSuccess) {
          if (userRole == 'Customer') {
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          } else if (userRole == 'Trader') {
            BlocProvider.of<AuthenticationBloc>(context).add(ShopRegister());
          }
        }

        if (state.isNotCompleted) {
          BlocProvider.of<AuthenticationBloc>(context).add(NotComplete());
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Form(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0,
                top: 10.0,
              ),
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 10.0,
              ),
              child: ListView(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Create an account",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  SocialMediaLink(
                    googleCallback: () {
                      BlocProvider.of<RegisterBloc>(context).add(
                        RegisterWithGoogle(),
                      );
                    },
                    isFocused: isFocused,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        textField(
                          label: "Username",
                          keyboardType: TextInputType.text,
                          controller: _usernameController,
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _usernameController.text.isNotEmpty &&
                                      state.isUsernameValid
                                  ? IconButton(
                                      onPressed: () {
                                        _usernameController.clear();
                                      },
                                      icon: Icon(
                                        EvaIcons.closeCircle,
                                        color: Colors.grey,
                                        size: 25.0,
                                      ),
                                    )
                                  : SizedBox(),
                              !state.isUsernameValid &&
                                      _usernameController.text.isNotEmpty
                                  ? Icon(
                                      EvaIcons.alertCircle,
                                      color: Colors.red,
                                      size: 25.0,
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        !state.isUsernameValid
                            ? Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Invalid username",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 15,
                        ),
                        textField(
                          label: "Email",
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _emailController.text.isNotEmpty &&
                                      state.isEmailValid
                                  ? IconButton(
                                      onPressed: () {
                                        _usernameController.clear();
                                      },
                                      icon: Icon(
                                        EvaIcons.closeCircle,
                                        color: Colors.grey,
                                        size: 25.0,
                                      ),
                                    )
                                  : SizedBox(),
                              !state.isEmailValid &&
                                      _emailController.text.isNotEmpty
                                  ? Icon(
                                      EvaIcons.alertCircle,
                                      color: Colors.red,
                                      size: 25.0,
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        !state.isEmailValid
                            ? Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  "Invalid email",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 15,
                        ),
                        PasswordTextFieldWithIcon(
                          controller: _passwordController,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 65.3,
                          width: MediaQuery.of(context).size.width * 0.85,
                          margin: EdgeInsets.only(bottom: 16.0, top: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: new DropdownButton<String>(
                                isDense: true,
                                value: userRole,
                                icon: Icon(EvaIcons.arrowIosDownwardOutline),
                                hint: Text("Select account type"),
                                items: <String>['Customer', 'Trader']
                                    .map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: _onUserRoleChanged,
                              ),
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "By Registering, You agree to Homy's",
                                style: TextStyle(
                                    fontSize: 10.5,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54),
                              ),
                              TextSpan(
                                text: " Terms of service",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              TextSpan(
                                text: " and",
                                style: TextStyle(
                                    fontSize: 10.5,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54),
                              ),
                              TextSpan(
                                text: " Privacy policy",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: FlatButton(
                              disabledColor: Color.fromRGBO(235, 87, 87, 0.5),
                              onPressed: isRegisterButtonEnabled(state)
                                  ? _onFormSubmitted
                                  : null,
                              child: state.isSubmitting
                                  ? SizedBox(
                                      width: 25.0,
                                      height: 25.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1.5,
                                        valueColor:
                                            new AlwaysStoppedAnimation<Color>(
                                                Colors.redAccent),
                                      ),
                                    )
                                  : Text(
                                      "Create an account",
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                              color: Color.fromRGBO(235, 87, 87, 1),
                              textColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
