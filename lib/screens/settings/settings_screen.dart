import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todos/screens/screens.dart';
import 'package:flutter_firestore_todos/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);
  final bool isTrader = true;

  static TextStyle settingsHeader = GoogleFonts.openSans(
    fontSize: 16.0,
    color: Color.fromRGBO(0, 0, 0, 0.75),
    fontWeight: FontWeight.w700,
  );

  Widget settingsItem({name, icon, tap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color.fromRGBO(92, 103, 125, 1),
      ),
      title: Text(
        name,
        style: GoogleFonts.openSans(
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          color: Color.fromRGBO(0, 0, 0, 0.65),
        ),
      ),
      onTap: tap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            expandedHeight: 200.0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.black),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: CustomBackgroundAppBar(),
            ),
            actions: <Widget>[
              Icon(EvaIcons.moreVertical),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "USER SETTINGS",
                    style: settingsHeader,
                  ),
                ),
                settingsItem(
                  name: "Full name",
                  icon: EvaIcons.person,
                  tap: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(widget: SettingsName()));
                  },
                ),
                settingsItem(
                  name: "Email",
                  icon: EvaIcons.at,
                  tap: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(widget: SettingsEmail()));
                  },
                ),
                settingsItem(
                  name: "Passwrod",
                  icon: EvaIcons.lock,
                  tap: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(widget: SettingsPassword()));
                  },
                ),
                settingsItem(
                    name: "Delete account",
                    icon: EvaIcons.trash2,
                    tap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Delete account"),
                          content: RichText(
                            text: TextSpan(
                              text: "Be Carefull!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      " by deleting your account you can't be able to access your data or login to homy app.",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("CANCEL"),
                              onPressed: () {},
                            ),
                            FlatButton(
                              onPressed: () {
                                print("detele");
                              },
                              child: Text(
                                "DELETE",
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ],
                        ),
                        barrierDismissible: true,
                      );
                    }),
                Divider(
                  thickness: 0.5,
                  height: 1,
                  color: Colors.grey[200],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "STORE SETTINGS",
                    style: settingsHeader,
                  ),
                ),
                settingsItem(
                  name: "Store name",
                  icon: Icons.edit,
                  tap: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(widget: SettingsStoreName()));
                  },
                ),
                settingsItem(
                  name: "Store description",
                  icon: EvaIcons.infoOutline,
                  tap: () {
                    Navigator.of(context).push(
                        SlideLeftRoute(widget: SettingsStoreDescription()));
                  },
                ),
                settingsItem(
                  name: "Store location",
                  icon: Icons.location_on,
                  tap: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(widget: SettingsStoreLocation()));
                  },
                ),
                settingsItem(
                  name: "Store Number",
                  icon: EvaIcons.phoneOutline,
                  tap: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(widget: SettingsStorePhone()));
                  },
                ),
                settingsItem(
                  name: "Store type",
                  icon: EvaIcons.shoppingCartOutline,
                  tap: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(widget: SettingsStoreType()));
                  },
                ),
                Divider(
                  thickness: 0.5,
                  height: 1,
                  color: Colors.grey[200],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "APP SETTINGS",
                    style: settingsHeader,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    EvaIcons.bell,
                    color: Color.fromRGBO(92, 103, 125, 1),
                  ),
                  title: Text(
                    "Notifications",
                    style: GoogleFonts.openSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.65),
                    ),
                  ),
                  trailing: Switch(
                    onChanged: (value) {},
                    value: true,
                    activeColor: Colors.red[400],
                    activeTrackColor: Colors.red[100],
                  ),
                ),
                settingsItem(
                  name: "Language",
                  icon: EvaIcons.globe,
                  tap: () {
                    Navigator.of(context)
                        .push(SlideLeftRoute(widget: SettingsLanguage()));
                  },
                ),
                Divider(
                  thickness: 0.5,
                  height: 10,
                  color: Colors.grey[200],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "APP INFORMATION - 1.0 (beta)",
                    style: settingsHeader,
                  ),
                ),
                settingsItem(name: "Change Log", icon: EvaIcons.info),
                settingsItem(name: "Support", icon: EvaIcons.questionMark),
                settingsItem(name: "Achnowledgements", icon: EvaIcons.info),
              ],
            ),
          )
        ],
      ),
    );
  }
}
