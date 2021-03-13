import 'package:aytamy/app/app_model.dart';
import 'package:aytamy/common/widgets/custom_image_loader.dart';
import 'package:aytamy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeNavigationDrawer extends StatefulWidget {
  final Function onNavigateClick;

  HomeNavigationDrawer({this.onNavigateClick});

  @override
  State<StatefulWidget> createState() {
    return _HomeNavigationDrawer();
  }
}

class _HomeNavigationDrawer extends State<HomeNavigationDrawer> {
  CurrentHomeSelection _currentHomeSelection;

  @override
  void initState() {
    _currentHomeSelection = CurrentHomeSelection.HOME;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffe4e4e4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffffffff),
              child: createDrawerHeader(),
            ),
            Divider(
              color: Color(0xffe4e4e4),
            ),
            Expanded(
              child: Container(
                color: Color(0xffffffff),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Color(0xffffffff),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Icon(
                              Icons.add_circle,
                              color: Color(0xff4f4f4f),
                            ),
                            Container(
                              margin: EdgeInsets.all(14.0),
                              child: // يتيم جديد
                                  Text(
                                S.current.NewOrphan,
                                style: const TextStyle(
                                    color: const Color(0xff4f4f4f),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "GESSTwoMedium",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          widget.onNavigateClick(CurrentHomeSelection.HOME);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      color: Color(0xffffffff),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Icon(
                              Icons.replay_5,
                              color: Color(0xff4f4f4f),
                            ),
                            Container(
                              margin: EdgeInsets.all(14.0),
                              child: Text(
                                S.current.latestTransaction,
                                style: const TextStyle(
                                    color: const Color(0xff4f4f4f),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "GESSTwoMedium",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          widget.onNavigateClick(CurrentHomeSelection.HOME);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      color: Color(0xffffffff),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Icon(
                              Icons.home,
                              color: Color(0xff4f4f4f),
                            ),
                            Container(
                              margin: EdgeInsets.all(14.0),
                              child: Text(
                                S.current.main,
                                style: const TextStyle(
                                    color: const Color(0xff4f4f4f),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "GESSTwoMedium",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          widget.onNavigateClick(CurrentHomeSelection.HOME);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      color: Color(0xffffffff),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Icon(
                              Icons.notifications_active,
                              color: Color(0xff4f4f4f),
                            ),
                            Container(
                              margin: EdgeInsets.all(14.0),
                              child: Text(
                                S.current.notification,
                                style: const TextStyle(
                                    color: const Color(0xff4f4f4f),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "GESSTwoMedium",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          widget.onNavigateClick(CurrentHomeSelection.HOME);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      color: Color(0xffffffff),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Icon(
                              Icons.favorite_outlined,
                              color: Color(0xff4f4f4f),
                            ),
                            Container(
                              margin: EdgeInsets.all(14.0),
                              child: Text(
                                S.current.myPriority,
                                style: const TextStyle(
                                    color: const Color(0xff4f4f4f),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "GESSTwoMedium",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          widget.onNavigateClick(CurrentHomeSelection.HOME);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Color(0xffe4e4e4),
            ),
            Container(
              color: Color(0xffffffff),
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Icon(
                      Icons.login,
                      color: Color(0xff4f4f4f),
                    ),
                    Container(
                      margin: EdgeInsets.all(24.0),
                      child: // يتيم جديد
                          Text(
                        S.current.signOut,
                        style: const TextStyle(
                            color: const Color(0xff4f4f4f),
                            fontWeight: FontWeight.w500,
                            fontFamily: "GESSTwoMedium",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                      ),
                    )
                  ],
                ),
                onTap: () {
                  widget.onNavigateClick(CurrentHomeSelection.HOME);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 75),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: (Provider.of<AppModel>(context).getUserProfileImage() !=
                          '' &&
                      Provider.of<AppModel>(context).getUserProfileImage() !=
                          'null')
                  ? CustomImageLoader.image(
                      url: Provider.of<AppModel>(context).getUserProfileImage(),
                      width: 110,
                      height: 110,
                      fit: BoxFit.contain)
                  : Image(
                      width: 110,
                      height: 110,
                      image: AssetImage("assets/images/img_profile.jpeg"),
                      fit: BoxFit.contain),
            ),
            Flexible(
                child: (Provider.of<AppModel>(context).getUserName().isEmpty)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                "محمد مسعود",
                                // Provider.of<AppModel>(context).getUserName(),
                                style: TextStyle(
                                    color: const Color(0xff4f4f4f),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "GESSTwoBold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                          // Rectangle 85
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Opacity(
                              opacity: 0.4000000059604645,
                              child: Text("mohamedmasod@gmail.com",
                                  style: const TextStyle(
                                      color: const Color(0xff4f4f4f),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "SFProDisplay",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                        ],
                      )
                    : Container()),
            SizedBox(
              width: 8.0,
            ),
          ]),
    );
  }
}

enum CurrentHomeSelection { HOME, TRANSACTION, NOTIFICATION, PROFILE }
