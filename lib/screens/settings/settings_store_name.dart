import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/shopRegister_bloc/bloc.dart';
import 'package:rules/rules.dart';
import 'package:shop_repository/shop_repository.dart';

class SettingsStoreName extends StatefulWidget {
  final Shop shop;
  SettingsStoreName({Key key, this.shop}) : super(key: key);

  @override
  _SettingsStoreNameState createState() => _SettingsStoreNameState();
}

class _SettingsStoreNameState extends State<SettingsStoreName> {
  final _formKey = GlobalKey<FormState>();
  final _storeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit store name"),
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
                          Text('Store name changed successfully.'),
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
                          .copyWith(shopName: _storeNameController.text),
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
                validator: (storeName) {
                  final rule = Rule(
                    storeName,
                    name: "Store name",
                    isRequired: true,
                    maxLength: 32,
                  );
                  return rule.hasError ? rule.error : null;
                },
                controller: _storeNameController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Edit store name',
                  hintText: widget.shop.shopName,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "You can choose a new store name on Homy. If you do, other people will not be able to see your old store name on products interactions.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "You can use valid store name address otherwise an error will occure.",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
