import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/blocs/blocs.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';
import 'package:rules/rules.dart';
import 'package:shop_repository/shop_repository.dart';

class PublishPage extends StatelessWidget {
  const PublishPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UploadImageBloc(shopRepository: FirebaseShopRepository()),
      child: PublishPageProvided(),
    );
  }
}

class PublishPageProvided extends StatefulWidget {
  PublishPageProvided({Key key}) : super(key: key);

  @override
  _PublishPageProvidedState createState() => _PublishPageProvidedState();
}

class _PublishPageProvidedState extends State<PublishPageProvided> {
  String value = 'All';
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _offerPriceController = TextEditingController();
  final _inStockController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void setValue(String newValue) {
    setState(() {
      value = newValue;
    });
  }

  int parseToInt(String number) {
    return number.trim() != '' ? int.parse(number) : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Post Details",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
            if (state is Authenticated) {
              return BlocBuilder<SelectedImagesBloc, SelectedImagesState>(
                  builder: (context, image) {
                if (image is SelectedImages)
                  return FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        BlocProvider.of<UploadImageBloc>(context).add(
                          UploadImage(
                            product: Product(
                              description: _descriptionController.text,
                              price: parseToInt(_priceController.text),
                              offerPrice:
                                  parseToInt(_offerPriceController.text),
                              inStock: parseToInt(_inStockController.text),
                              category: value,
                              authorId: state.user.id,
                              photos: image.selectedImages,
                            ),
                          ),
                        );
                      }
                      return null;
                    },
                    child: Text(
                      "Post",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );

                return SizedBox();
              });
            }

            return FlatButton(
              onPressed: null,
              child: Text(
                "Post",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          })
        ],
      ),
      body: BlocListener<UploadImageBloc, UploadImageState>(
        listener: (context, state) {
          if (state is UploadImageProgress) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  duration: Duration(minutes: 10),
                  behavior: SnackBarBehavior.floating,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(EvaIcons.cloudUploadOutline),
                      Text(' Publishing your product....'),
                    ],
                  ),
                ),
              );
          }
          if (state is UploadImageSuccess) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        EvaIcons.checkmarkCircle2,
                        color: Colors.green[800],
                      ),
                      Text(' Product published'),
                    ],
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            BlocProvider.of<SelectedImagesBloc>(context).add(ClearSelected());
            BlocProvider.of<UploadImageBloc>(context).add(ClearUploadImage());
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          }
        },
        child: BlocBuilder<SelectedImagesBloc, SelectedImagesState>(
            builder: (context, state) {
          if (state is SelectedImages)
            return Container(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PreviewSelectedImages(
                      selectedImages: state.selectedImages,
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              validator: (description) {
                                final rule = Rule(
                                  description,
                                  name: "Description",
                                  isRequired: false,
                                  maxLength: 2000,
                                );

                                return rule.hasError ? rule.error : null;
                              },
                              controller: _descriptionController,
                              decoration: InputDecoration(
                                hintText: "write a description",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              minLines: 3,
                              maxLines: 6,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                "Additional Info",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SectionDropdown(value: value, setValue: setValue),
                            IsOfferSection(controller: _offerPriceController),
                            PriceSection(controller: _priceController),
                            InStockSection(controller: _inStockController),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          return SizedBox();
        }),
      ),
    );
  }
}
