import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/create_shop_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/shopRegister_bloc/bloc.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/screens/signup/shop_signup_form.dart';

class ShopSignup extends StatefulWidget {
  ShopSignup({Key key}) : super(key: key);

  @override
  _ShopSignupState createState() => _ShopSignupState();
}

class _ShopSignupState extends State<ShopSignup> {
  final _shopNameController = TextEditingController();
  final _shopPhoneController = TextEditingController();
  final _shopLocationController = TextEditingController();
  final _shopDescriptionController = TextEditingController();
  ShopRegisterBloc _shopRegisterBloc;

  @override
  void initState() {
    super.initState();
    _shopRegisterBloc = BlocProvider.of<ShopRegisterBloc>(context);
    _shopNameController.addListener(_onShopNameChanged);
    _shopPhoneController.addListener(_onShopPhoneChanged);
    _shopLocationController.addListener(_onShopLocationChanged);
    _shopDescriptionController.addListener(_onShopDescriptionChanged);
  }

  @override
  void dispose() {
    _shopNameController.dispose();
    _shopPhoneController.dispose();
    _shopLocationController.dispose();
    _shopDescriptionController.dispose();
    super.dispose();
  }

  void _onShopNameChanged() {
    _shopRegisterBloc.add(
      ShopNameChanged(
        shopName: _shopNameController.text,
      ),
    );
  }

  void _onShopPhoneChanged() {
    _shopRegisterBloc.add(
      ShopPhoneChanged(
        shopPhone: _shopPhoneController.text,
      ),
    );
  }

  void _onShopLocationChanged() {
    _shopRegisterBloc.add(
      ShopLocationChanged(
        shopLocation: _shopLocationController.text,
      ),
    );
  }

  void _onShopDescriptionChanged() {
    _shopRegisterBloc.add(
      ShopDescriptionChanged(
        shopDescription: _shopDescriptionController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateShopBloc, MyState>(
      builder: (context, state) {
        if (state is ShopTypeChoose) {
          return ChooseCategoriesScreen(
            shopName: _shopNameController.text,
            shopDescription: _shopDescriptionController.text,
            shopPhone: _shopPhoneController.text,
            shopLocation: _shopLocationController.text,
          );
        }
        if (state is ShopRegisterInfo)
          return ShopSignupForm(
            shopNameController: _shopNameController,
            shopDescriptionController: _shopDescriptionController,
            shopPhoneController: _shopPhoneController,
            shopLocationController: _shopLocationController,
          );
      },
    );
  }
}
