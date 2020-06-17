import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:photo_manager/photo_manager.dart';

import 'imagePicker_bloc/selectedImages_bloc.dart';
import 'imagePicker_bloc/selectedImages_events.dart';

class ImagePick extends StatefulWidget {
  ImagePick({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectedImagesBloc>(
      create: (context) => SelectedImagesBloc(),
      child: MediaGrid(),
    );
  }
}

class MediaGrid extends StatefulWidget {
  @override
  _MediaGridState createState() => _MediaGridState();
}

class _MediaGridState extends State<MediaGrid>
    with SingleTickerProviderStateMixin {
  List<AssetPathEntity> _albumsList = new List();

  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _fetchNewMedia() async {
    var result = await PhotoManager.requestPermission();
    if (result) {
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList();

      setState(() {
        _albumsList = albums;
      });
    } else {
      PhotoManager.openSetting();
    }
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SelectedImagesBloc selectedImagesBloc =
        BlocProvider.of<SelectedImagesBloc>(context);
    return DefaultTabController(
      length: _albumsList.length,
      child: Scaffold(
        appBar: AppBar(
          leading: BlocBuilder<SelectedImagesBloc, List<AssetEntity>>(
            builder: (context, images) {
              return images.length > 0
                  ? IconButton(
                      onPressed: () {
                        selectedImagesBloc.add(ClearSelected());
                      },
                      icon: Icon(EvaIcons.close))
                  : IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        EvaIcons.arrowBackOutline,
                      ),
                    );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: BlocBuilder<SelectedImagesBloc, List<AssetEntity>>(
            builder: (context, images) {
              return Text(
                images.length > 0 ? "${images.length} selected" : "Gallery",
                style: TextStyle(
                  color: Colors.black,
                ),
              );
            },
          ),
          actions: <Widget>[
            BlocBuilder<SelectedImagesBloc, List<AssetEntity>>(
                builder: (context, images) {
              return images.length > 0
                  ? FlatButton(
                      onPressed: () {
                        if (images.length > 10) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Row(
                                children: <Widget>[
                                  Icon(
                                    EvaIcons.alertCircleOutline,
                                    color: Colors.redAccent,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text("You can't select more than 10 images."),
                                ],
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            SlideLeftRoute(
                              widget: PublishPage(selectedImages: images),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        print("camera");
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: Color(0xff5f6368),
                        semanticLabel: "Camera",
                      ),
                    );
            }),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Color(0xff5f6368),
            indicator: MD2Indicator(
                //it begins here
                indicatorHeight: 3,
                indicatorColor: Color(0xff1a73e8),
                indicatorSize:
                    MD2IndicatorSize.normal //3 different modes tiny-normal-full
                ),
            isScrollable: true,
            labelColor: Colors.black,
            tabs: List.generate(
              _albumsList.length,
              (index) => Tab(
                text: _albumsList[index].name,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: _albumsList
              .map(
                (e) => new GridViewImages(
                  index: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

typedef AssetCallback = Function(AssetEntity entity);

class GridViewImages extends StatefulWidget {
  final AssetPathEntity index;
  GridViewImages({Key key, this.index}) : super(key: key);

  @override
  _GridViewImagesState createState() => _GridViewImagesState();
}

class _GridViewImagesState extends State<GridViewImages> {
  List<AssetEntity> _mediaList = [];
  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _fetchNewMedia() async {
    if (_mediaList.isEmpty) {
      List<AssetEntity> media =
          await widget.index.getAssetListPaged(0, widget.index.assetCount);

      setState(() {
        _mediaList = media;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(5.0),
      itemCount: _mediaList.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
          future: _mediaList[index].thumbDataWithSize(200, 200),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SelectedOverlay(
                data: snapshot.data,
                index: index,
                mediaList: _mediaList,
              );
            }
            return Container();
          },
        );
      },
    );
  }
}

class SelectedOverlay extends StatefulWidget {
  final int index;
  final List<AssetEntity> mediaList;
  final dynamic data;
  const SelectedOverlay({Key key, this.index, this.mediaList, this.data})
      : super(key: key);

  @override
  _SelectedOverlayState createState() => _SelectedOverlayState();
}

class _SelectedOverlayState extends State<SelectedOverlay> {
  @override
  Widget build(BuildContext context) {
    final SelectedImagesBloc selectedImagesBloc =
        BlocProvider.of<SelectedImagesBloc>(context);

    return BlocBuilder<SelectedImagesBloc, List<AssetEntity>>(
      builder: (context, images) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: InkWell(
            onTap: () {
              selectedImagesBloc.add(
                SelectImage(widget.mediaList[widget.index]),
              );
            },
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.memory(widget.data, fit: BoxFit.cover),
                ),
                images.contains(widget.mediaList[widget.index])
                    ? Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(254, 254, 254, 0.3),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Center(
                              child: Text(
                                "${images.indexOf(widget.mediaList[widget.index]) + 1}",
                                style: TextStyle(
                                  letterSpacing: 0,
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
