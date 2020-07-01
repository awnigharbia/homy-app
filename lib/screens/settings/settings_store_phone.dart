import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/authentication_bloc/bloc.dart';
import 'package:flutter_firestore_todos/blocs/shopRegister_bloc/bloc.dart';
import 'package:rules/rules.dart';
import 'package:shop_repository/shop_repository.dart';

class SettingsStorePhone extends StatefulWidget {
  final Shop shop;
  SettingsStorePhone({Key key, this.shop}) : super(key: key);

  @override
  _SettingsStorePhoneState createState() => _SettingsStorePhoneState();
}

class _SettingsStorePhoneState extends State<SettingsStorePhone> {
  final _formKey = GlobalKey<FormState>();
  final _storePhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit store phone"),
        actions: <Widget>[
          BlocListener<ShopRegisterBloc, ShopRegisterState>(
            listener: (context, state) {
              if (state.isUpdateSuccess) {
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Store phone changed successfully.'),
                          Icon(
                            EvaIcons.checkmarkCircle2,
                            color: Colors.green[800],
                          ),
                        ],
                      ),
                    ),
                  );
              }
            },
            child: IconButton(
              icon: Icon(EvaIcons.checkmark),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  BlocProvider.of<ShopRegisterBloc>(context).add(
                    UpdateShop(
                      shop: widget.shop
                          .copyWith(shopPhone: _storePhoneController.text),
                    ),
                  );
                }
              },
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                validator: (storeLocation) {
                  final rule = Rule(
                    storeLocation,
                    name: "Store Phone",
                    isRequired: true,
                    isNumeric: true,
                    minLength: 10,
                  );
                  return rule.hasError ? rule.error : null;
                },
                controller: _storePhoneController,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Edit store phone',
                  hintText: widget.shop.shopPhone,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "You can choose a new store phone on Homy. If you do, other people will not be able to see your old store phone on products interactions.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "You can use valid store phone otherwise an error will occure.",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
