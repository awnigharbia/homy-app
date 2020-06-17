import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class PublishPage extends StatefulWidget {
  final List<AssetEntity> selectedImages;
  final double imageRadius = 5;
  const PublishPage({Key key, this.selectedImages}) : super(key: key);

  @override
  _PublishPageState createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  bool isOffer = false;

  String dropdownValue = 'Section 1';

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
          FlatButton(
            onPressed: () {
              print("post");
            },
            child: Text(
              "Post",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  scrollDirection: Axis.horizontal,
                  children: widget.selectedImages
                      .asMap()
                      .map(
                        (index, image) => MapEntry(
                          index,
                          FutureBuilder(
                            future: image.originBytes,
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SizedBox(
                                    width: 200,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          widget.imageRadius),
                                      child: Image.memory(
                                        snapshot.data,
                                        fit: BoxFit.cover,
                                        scale: 5,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        ),
                      )
                      .values
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
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
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "Additional Info",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Section",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                        DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(EvaIcons.arrowIosDownwardOutline),
                          iconSize: 24,
                          elevation: 16,
                          underline: Container(
                            height: 0,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: <String>[
                            'Section 1',
                            'section 2',
                            'section 3',
                            'section 4'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Offer",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                        Switch(
                          onChanged: (value) {
                            setState(() {
                              isOffer = value;
                            });
                          },
                          value: isOffer,
                        ),
                      ],
                    ),
                    isOffer
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Offer percentage",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.29,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "offer %",
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Product Price",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.29,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Enter price ₪",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "In Stock",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Enter total",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Product size",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                        ToggleButtons(
                          borderRadius: BorderRadius.circular(5.0),
                          onPressed: (int index) {
                            print("change size");
                          },
                          children: <Widget>[
                            Text("S"),
                            Text("M"),
                            Text("XL"),
                            Text("XXL"),
                            Text("XXXL"),
                          ],
                          isSelected: [
                            true,
                            false,
                            false,
                            false,
                            false,
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
