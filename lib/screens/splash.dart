import 'package:aytamy/app/app_model.dart';
import 'package:aytamy/app/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appModel = Provider.of<AppModel>(context, listen: false);
    Future.delayed(Duration(seconds: 2), () {
      if (appModel.isUserLoggedIn() != null && appModel.isUserLoggedIn()) {
        Navigator.of(context).pushNamed(Routes.HOME);
      } else {
        Navigator.of(context).pushNamed(Routes.INTO_SCREEN);
      }
    });
    return Container(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 128.00436401367188,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Image.asset(
            "assets/logo.png",
            height: MediaQuery.of(context).size.height * .35,
          ),
        ),
      ),
    );
  }
}
