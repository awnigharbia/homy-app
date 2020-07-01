import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rules/rules.dart';
import 'package:shop_repository/shop_repository.dart';

class MyShopPost extends StatefulWidget {
  final String uid;
  final Product product;
  final String shopName;
  final String shopType;
  MyShopPost({
    Key key,
    this.uid,
    this.product,
    this.shopName,
    this.shopType,
  }) : super(key: key);

  @override
  _MyShopPostState createState() => _MyShopPostState();
}

class _MyShopPostState extends State<MyShopPost> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _saveChanges() {
      if (_formKey.currentState.validate()) {
        BlocProvider.of<ProductBloc>(context).add(
          UpdateProduct(
            product: widget.product
                .copyWith(description: _descriptionController.text),
          ),
        );
        BlocProvider.of<ProductBloc>(context).add(
          LoadProduct(uid: widget.uid),
        );
        Navigator.pop(context);
      }
    }

    Future<void> _showEditProductDialouge({Product updatedProduct}) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _descriptionController,
                  validator: (description) {
                    final rule = Rule(
                      description,
                      name: "Description",
                      isRequired: true,
                      maxLength: 1000,
                    );

                    return rule.hasError ? rule.error : null;
                  },
                  decoration: InputDecoration(
                    hintText: "Oh, Is it nice?",
                    labelText: "Write new description",
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Save'),
                onPressed: () {
                  _saveChanges();
                },
              ),
            ],
          );
        },
      );
    }

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductUpdated) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      EvaIcons.checkmarkCircle2,
                      color: Colors.green[800],
                    ),
                    Text(
                      ' Product updated successfully.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
        }
        if (state is ProductDeleted) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      EvaIcons.checkmarkCircle2,
                      color: Colors.green[800],
                    ),
                    Text(
                      ' Product deleted successfully.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          BlocProvider.of<ProductBloc>(context).add(
            LoadProduct(uid: widget.uid),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.shopName,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.shopType,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                  ),
                  width: 35,
                  height: 35,
                  child: PopupMenuButton(
                    tooltip: "Options",
                    onSelected: (option) {
                      if (option == 'edit') {
                        _showEditProductDialouge(
                            updatedProduct: widget.product);
                      }
                      if (option == 'delete') {
                        BlocProvider.of<ProductBloc>(context).add(
                          DeleteProduct(
                            productId: widget.product.id,
                            downUrl: widget.product.photos,
                          ),
                        );
                      }
                    },
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    icon: Icon(EvaIcons.moreHorizotnalOutline),
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        height: 50,
                        value: "edit",
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Icon(EvaIcons.edit,
                                  color: Color.fromRGBO(0, 0, 0, 0.8)),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Edit product")
                            ],
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        height: 50,
                        value: "delete",
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Icon(EvaIcons.trash2Outline,
                                  color: Color.fromRGBO(0, 0, 0, 0.8)),
                              SizedBox(width: 10),
                              Text("Delete Product")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: widget.product.photos.length != 1
                  ? Container(
                      height: 400,
                      child: Swiper(
                        pagination: new SwiperPagination(),
                        indicatorLayout: PageIndicatorLayout.COLOR,
                        itemCount: widget.product.photos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              widget.product.photos[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(widget.product.photos[0],
                          fit: BoxFit.cover),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.red[100],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            EvaIcons.heart,
                            color: Colors.redAccent,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Like",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.0,
                                color: Colors.redAccent),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[200],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            EvaIcons.bookmarkOutline,
                            color: Colors.black45,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Save",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.0,
                                color: Colors.black45),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey[200],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            EvaIcons.paperPlaneOutline,
                            color: Colors.black45,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Share",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.0,
                              color: Colors.black45,
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: widget.shopName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                TextSpan(
                  text: "   ${widget.product.description}",
                  style: TextStyle(color: Colors.black45),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
