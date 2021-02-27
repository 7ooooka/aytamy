import 'package:aytamy/app/app_model.dart';
import 'package:aytamy/app/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appModel = Provider.of<AppModel>(context);
    Future.delayed(Duration(seconds: 2), () {
      if (appModel.isUserLoggedIn()) {
        Navigator.of(context).pushNamed(Routes.INTO_SCREEN);
      } else {
        Navigator.of(context).pushNamed(Routes.HOME);
      }
    });
    return Container(
      child: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
