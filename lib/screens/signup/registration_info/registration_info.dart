import 'package:aytamy/common/colors.dart';
import 'package:aytamy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationInfoStepScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationInfo();
  }
}

class _RegistrationInfo extends State<RegistrationInfoStepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.red),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, size: 22, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: // كلمة المرور
            Text(S.current.myInfo,
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontFamily: "GESSTwoBold",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.center),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/images/hci_adventures.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .32,
            fit: BoxFit.cover,
          ),
          LinearProgressIndicator(
            value: .3,
            backgroundColor: Color(0xffbdbdbd),
            valueColor: new AlwaysStoppedAnimation<Color>(rustRed),
            minHeight: 6,
          ),
          SizedBox(
            height: 40,
          ),

          //////////////////////
          Text("هذه مَرَتك الأولى لك في الكفاله",
              style: const TextStyle(
                  color: const Color(0xffdb0011),
                  fontWeight: FontWeight.w800,
                  fontFamily: "GESSTwoBold",
                  fontStyle: FontStyle.normal,
                  fontSize: 21.0),
              textAlign: TextAlign.center),
          SizedBox(
            height: 40,
          ),
          // Rectangle
          Container(
            width: MediaQuery.of(context).size.width * .75,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xffbdbdbd), width: 1)),
            child: Text(S.current.no,
                style: const TextStyle(
                    color: const Color(0xffbdbdbd),
                    fontWeight: FontWeight.w800,
                    fontFamily: "GESSTwoBold",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .75,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xffbdbdbd), width: 1)),
            child: Text(S.current.yes,
                style: const TextStyle(
                    color: const Color(0xffbdbdbd),
                    fontWeight: FontWeight.w800,
                    fontFamily: "GESSTwoBold",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0),
                textAlign: TextAlign.center),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .75,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffdb0011),
            ),

//////////////////////
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 22,
                ),
                Text(S.current.continueText,
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w700,
                        fontFamily: "GESSTwoBold",
                        fontStyle: FontStyle.normal,
                        fontSize: 21.0),
                    textAlign: TextAlign.left),
                Container(
                  margin: EdgeInsets.only(left: 18),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: const TextStyle(
                          color: const Color(0xffff6a00),
                          fontWeight: FontWeight.w900,
                          fontFamily: "GESSTwoBold",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      text: S.current.joinUs + " "),
                  TextSpan(
                      style: const TextStyle(
                          color: const Color(0xff4f4f4f),
                          fontWeight: FontWeight.w700,
                          fontFamily: "GESSTwoBold",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                      text: S.current.doNotHaveAccount),
                ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
