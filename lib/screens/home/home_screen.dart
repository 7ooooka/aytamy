import 'package:aytamy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_navigation_drawer.dart';
import 'home_screen_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  CurrentHomeSelection _currentDrawerSelection;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _currentDrawerSelection =
            ModalRoute.of(context).settings.arguments as CurrentHomeSelection;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        title: // كلمة المرور
            Text(S.current.main,
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontFamily: "GESSTwoBold",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.center),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: GestureDetector(
              child: new Container(
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  "assets/logo.png",
                  color: Colors.white,
                ),
              ),
              onTap: () {
                // Navigator.of(context).pushNamed(Routes.CART);
              },
            ),
          ),
        ],
      ),
      drawer: HomeNavigationDrawer(
        onNavigateClick: (selectedNav) {
          setState(() {
            _currentDrawerSelection = selectedNav;
          });
        },
      ),
      body: Container(
          margin: EdgeInsets.only(top: 2.0),
          alignment: Alignment.topCenter,
          child: renderMainView()),
    );
  }

  Widget renderMainView() {
    print("renderMainView ----> " + _currentDrawerSelection.toString());
    switch (_currentDrawerSelection) {
      case CurrentHomeSelection.HOME:
        return HomeScreenView();
      case CurrentHomeSelection.TRANSACTION:
        // return TransactionScreen();

        break;
      case CurrentHomeSelection.NOTIFICATION:
        // return NotificationScreen();
        break;
      case CurrentHomeSelection.PROFILE:
        // return ProfileScreen();
        break;
      default:
        {
          return HomeScreenView();
        }
    }
  }
}
