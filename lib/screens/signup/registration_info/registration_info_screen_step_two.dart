import 'package:aytamy/app/route.dart';
import 'package:aytamy/common/colors.dart';
import 'package:aytamy/common/providers/user_model.dart';
import 'package:aytamy/common/stats_widgets.dart';
import 'package:aytamy/generated/l10n.dart';
import 'package:aytamy/screens/signup/provider/registrationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationInfoStepTwoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationInfoStepTwoState();
  }
}

class _RegistrationInfoStepTwoState
    extends State<RegistrationInfoStepTwoScreen> {
  CurrentSelectedOption _currentSelectedOption;
  RegistrationModel _registrationModel= RegistrationModel();
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
        title: Text(S.current.myInfo,
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "GESSTwoBold",
                fontStyle: FontStyle.normal,
                fontSize: 18.0),
            textAlign: TextAlign.center),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/hci_adventures.jpg",
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .32,
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
            Text(S.current.registrationInfoText2,
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
            GestureDetector(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .75,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: (_currentSelectedOption ==
                            CurrentSelectedOption.OPTION_ONE)
                            ? Color(0xffdb0011)
                            : Color(0xffbdbdbd),
                        width: 2)),
                child: Text(S.current.male,
                    style: const TextStyle(
                        color: const Color(0xffbdbdbd),
                        fontWeight: FontWeight.w800,
                        fontFamily: "GESSTwoBold",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
              ),
              onTap: () {
                setState(() {
                  _currentSelectedOption = CurrentSelectedOption.OPTION_ONE;
                });
              },
            ),
            SizedBox(
              height: 14,
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * .75,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: (_currentSelectedOption ==
                            CurrentSelectedOption.OPTION_TWO)
                            ? Color(0xffdb0011)
                            : Color(0xffbdbdbd),
                        width: 2)),
                child: Text(S.current.female,
                    style: const TextStyle(
                        color: Color(0xffbdbdbd),
                        fontWeight: FontWeight.w800,
                        fontFamily: "GESSTwoBold",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.0),
                    textAlign: TextAlign.center),
              ),
              onTap: () {
                setState(() {
                  _currentSelectedOption = CurrentSelectedOption.OPTION_TWO;
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * .75,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffdb0011),
              ),
              child: GestureDetector(
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
                onTap: () {
                  if (_currentSelectedOption ==
                      CurrentSelectedOption.OPTION_ONE) {
                    _registrationModel
                        .updateUserData(
                        onSuccess: () {
                          Navigator.of(context).pushNamed(
                              Routes.REGISTRATION_INFO_SCREEN_FINAL_SCREEN);
                        },
                        onError: (error) {
                          showError(error.toString());
                        });
                  } else if (_currentSelectedOption ==
                      CurrentSelectedOption.OPTION_TWO) {}
                },
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
                            text: S.current.need_support + " "),
                        TextSpan(
                            style: const TextStyle(
                                color: const Color(0xff4f4f4f),
                                fontWeight: FontWeight.w700,
                                fontFamily: "GESSTwoBold",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            text: S.current.registration_info_step_one),
                      ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum CurrentSelectedOption { OPTION_ONE, OPTION_TWO }
