import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class MyShopCategoriesEdit extends StatefulWidget {
  MyShopCategoriesEdit({Key key}) : super(key: key);

  @override
  _MyShopCategoriesEditState createState() => _MyShopCategoriesEditState();
}

class _MyShopCategoriesEditState extends State<MyShopCategoriesEdit> {
  List<String> alphabetList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J'
  ];

  void _onReorder(int oldIndex, int newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = alphabetList.removeAt(oldIndex);
        alphabetList.insert(newIndex, item);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Categories"),
      ),
      body: ReorderableListView(
        onReorder: _onReorder,
        children: List.generate(
          alphabetList.length,
          (index) => ListTile(
            contentPadding: EdgeInsets.only(left: 16.0),
            key: Key("$index"),
            leading: Icon(EvaIcons.list),
            title: Text(
              "Category $index",
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: PopupMenuButton(
              offset: Offset(0, 50),
              tooltip: "Options",
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              icon: Icon(EvaIcons.moreVertical),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
                PopupMenuItem(
                  height: 50,
                  value: Options.copyUrl,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(EvaIcons.edit,
                            color: Color.fromRGBO(0, 0, 0, 0.8)),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Edit name")
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  height: 50,
                  value: Options.copyUrl,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(EvaIcons.trash2Outline,
                            color: Color.fromRGBO(0, 0, 0, 0.8)),
                        SizedBox(width: 10),
                        Text("Delete category")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
