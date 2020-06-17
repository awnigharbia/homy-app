import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class SavedItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Saved",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              "Most Recent",
              style: TextStyle(color: Colors.black),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SavedItem(
                    title: "Collection 1",
                    owner: "Taj-Mall",
                    imageCount: 4,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1519167130418-c3640bd21b7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
                  ),
                  SavedItem(
                    title: "Collection 2",
                    owner: "Al-Helo Shop",
                    imageCount: 2,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1571455786673-9d9d6c194f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                  SavedItem(
                    title: "Collection 3",
                    owner: "Metro-Mall",
                    imageCount: 1,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1503341733017-1901578f9f1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                  SavedItem(
                    title: "Collection 1",
                    owner: "Taj-Mall",
                    imageCount: 4,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1519167130418-c3640bd21b7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
                  ),
                  SavedItem(
                    title: "Collection 2",
                    owner: "Al-Helo Shop",
                    imageCount: 2,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1571455786673-9d9d6c194f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                  SavedItem(
                    title: "Collection 3",
                    owner: "Metro-Mall",
                    imageCount: 1,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1503341733017-1901578f9f1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                  SavedItem(
                    title: "Collection 1",
                    owner: "Taj-Mall",
                    imageCount: 4,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1519167130418-c3640bd21b7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
                  ),
                  SavedItem(
                    title: "Collection 2",
                    owner: "Al-Helo Shop",
                    imageCount: 2,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1571455786673-9d9d6c194f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                  SavedItem(
                    title: "Collection 3",
                    owner: "Metro-Mall",
                    imageCount: 1,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1503341733017-1901578f9f1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                  SavedItem(
                    title: "Collection 1",
                    owner: "Taj-Mall",
                    imageCount: 4,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1519167130418-c3640bd21b7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
                  ),
                  SavedItem(
                    title: "Collection 2",
                    owner: "Al-Helo Shop",
                    imageCount: 2,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1571455786673-9d9d6c194f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                  SavedItem(
                    title: "Collection 3",
                    owner: "Metro-Mall",
                    imageCount: 1,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1503341733017-1901578f9f1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                  SavedItem(
                    title: "Collection 1",
                    owner: "Taj-Mall",
                    imageCount: 4,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1519167130418-c3640bd21b7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
                  ),
                  SavedItem(
                    title: "Collection 2",
                    owner: "Al-Helo Shop",
                    imageCount: 2,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1571455786673-9d9d6c194f90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                  SavedItem(
                    title: "Collection 3",
                    owner: "Metro-Mall",
                    imageCount: 1,
                    isSaved: true,
                    thumbnail:
                        "https://images.unsplash.com/photo-1503341733017-1901578f9f1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
