import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';

class ShopScreen extends StatelessWidget {
  Widget wrapper({page}) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(padding: const EdgeInsets.all(8.0), sliver: page),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBarr(),
              ),
            ];
          },
          body: TabBarView(children: [
            wrapper(page: HomeShopTab()),
            ShopCollections(),
            wrapper(page: ShopCategories()),
            wrapper(page: ShopInfo()),
          ]),
        ),
      ),
    );
  }
}
