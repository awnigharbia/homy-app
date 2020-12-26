import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/blocs.dart';
import 'package:flutter_firestore_todos/blocs/shopRegister_bloc/shop_register_bloc.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_repository/shop_repository.dart';
import 'package:user_repository/user_repository.dart';

import 'blocs/create_shop_bloc/bloc.dart';
import 'blocs/imagePicker_bloc/selectedImages_bloc.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: UserRepository(),
              shopRepository: FirebaseShopRepository(),
            )..add(AppStarted());
          },
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            userRepository: UserRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => ShopRegisterBloc(
            shopRepository: FirebaseShopRepository(),
          ),
        ),
        BlocProvider<SelectedImagesBloc>(
          create: (context) => SelectedImagesBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homy App',
        theme: new ThemeData(
          primaryColor: Color.fromRGBO(235, 87, 87, 1),
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: "/",
        routes: {
          "/chooseCategories": (context) {
            return ChooseCategoriesScreen();
          },
          "/shop": (context) {
            return ShopScreen();
          },
          "/shopCollection/": (context) {
            return ShopCollection();
          },
          "/settings": (context) {
            return SettingsScreen();
          },
          "/selectShops": (context) {
            return SelectShops();
          },
          "/storyView": (context) {
            return StoryView();
          },
          "/editCategories": (context) {
            return MyShopCategoriesEdit();
          },
          "/imagePicker": (context) {
            return ImagePick();
          },
          '/': (BuildContext context) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (_, state) {
                if (state is Authenticated) {
                  return HomeScreen(
                    user: state.user,
                  );
                }
                if (state is AuthenticatedNotComplete) {
                  return ChooseTypeScreen(email: state.email);
                }
                if (state is TraderRegisterShop) {
                  return BlocProvider(
                    create: (context) => CreateShopBloc(),
                    child: ShopSignup(),
                  );
                }
                if (state is Unauthenticated) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => OnBoardBloc(),
                      ),
                    ],
                    child: OnBoardingScreen(),
                  );
                }

                return SplashScreen();
              },
            );
          },
        },
      ),
    );
  }
}
