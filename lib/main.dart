import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/register_bloc/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:flutter_firestore_todos/blocs/blocs.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
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
            )..add(AppStarted());
          },
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(
            userRepository: UserRepository(),
          ),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            userRepository: UserRepository(),
          ),
        ),
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
          "/shopCollection/custom": (context) {
            return MyShopCollection();
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
                  return ShopSignup();
                }
                if (state is Unauthenticated) {
                  return BlocProvider(
                    create: (context) => OnBoardBloc(),
                    child: OnBoardingScreen(),
                  );
                }
                // return HomeScreen();
                // return MultiBlocProvider(
                //   providers: [
                //     BlocProvider<TabBloc>(
                //       create: (context) => TabBloc(),
                //     ),
                //     BlocProvider<FilteredTodosBloc>(
                //       create: (context) => FilteredTodosBloc(
                //         todosBloc: BlocProvider.of<TodosBloc>(context),
                //       ),
                //     ),
                //     BlocProvider<StatsBloc>(
                //       create: (context) => StatsBloc(
                //         todosBloc: BlocProvider.of<TodosBloc>(context),
                //       ),
                //     ),
                //   ],
                //   child: HomeScreen1(),
                // );
                // }
                // if (state is Unauthenticated) {
                //   return OnboardingScreen();
                // }

                return SplashScreen();
              },
            );
          },
          '/addTodo': (context) {
            return AddEditScreen(
              onSave: (task, note) {
                BlocProvider.of<TodosBloc>(context).add(
                  AddTodo(Todo(task, note: note)),
                );
              },
              isEditing: false,
            );
          },
        },
      ),
    );
  }
}
