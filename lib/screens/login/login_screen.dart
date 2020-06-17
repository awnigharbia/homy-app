import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/blocs.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc _loginBloc;
  bool isFocused;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    KeyboardVisibility.onChange.listen((bool visible) {
      setState(() {
        isFocused = visible;
      });
    });
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    isFocused = false;
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void _onEmailChanged() {
    _loginBloc.add(LoginEmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(LoginPasswordChanged(password: _passwordController.text));
  }

  void _onResetPasswordWithEmail(String email) {
    _loginBloc.add(ResetPasswordWithEmail(email: email));
  }

  void _onFormSubmittied() {
    _loginBloc.add(LoginWithCredentialsPressed(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget textField({controller, keyboardType, label}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.only(
            top: 14.0,
            bottom: 14,
            left: 20,
            right: 20,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(fontSize: 16.0),
        ),
        controller: controller,
        textInputAction: TextInputAction.next,
      ),
    );
  }

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
              icon: Icon(EvaIcons.arrowBackOutline),
            ),
            iconTheme:
                IconThemeData(color: Color.fromRGBO(235, 87, 87, 1), size: 200),
            backgroundColor: Colors.transparent,
            title: SvgPicture.asset("assets/homy.svg", height: 40),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.isFailure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Invaild email or password.'),
                          Icon(Icons.error)
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              }
              if (state.isResetSuccess) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Password reset email was sent.',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Icon(EvaIcons.alertCircle),
                        ],
                      ),
                      backgroundColor: Colors.orangeAccent,
                    ),
                  );
              }

              if (state.isResetFailure) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Reset password failed.'),
                          Icon(Icons.error)
                        ],
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
              }
              if (state.isUserNotFound) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('No user found, please register!'),
                          Icon(EvaIcons.alertCircle),
                        ],
                      ),
                      backgroundColor: Colors.orangeAccent,
                    ),
                  );
              }

              if (state.isSuccess) {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Form(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10.0),
                    child: ListView(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Welcome back!",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  "Login with your email to start shopping",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 16.0,
                        ),
                        SocialMediaLink(
                          googleCallback: () {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginWithGooglePressed(),
                            );
                          },
                          isFocused: isFocused,
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                          child: Column(
                            children: <Widget>[
                              textField(
                                controller: _emailController,
                                label: 'Email',
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              PasswordTextFieldWithIcon(
                                controller: _passwordController,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Align(
                                alignment: FractionalOffset.topLeft,
                                child: FlatButton(
                                  onPressed: () {
                                    _onResetPasswordWithEmail(
                                        _emailController.text);
                                  },
                                  child: Text(
                                    "Forgot your password ?",
                                    style: TextStyle(
                                      fontSize: 11,
                                      height: 1.5,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.redAccent,
                                    ),
                                  ),
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
                                    disabledColor:
                                        Color.fromRGBO(235, 87, 87, 0.5),
                                    onPressed: isLoginButtonEnabled(state)
                                        ? _onFormSubmittied
                                        : null,
                                    child: state.isSubmitting
                                        ? SizedBox(
                                            width: 25.0,
                                            height: 25.0,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 1.5,
                                              valueColor:
                                                  new AlwaysStoppedAnimation<
                                                      Color>(Colors.redAccent),
                                            ),
                                          )
                                        : Text(
                                            "Login",
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
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
