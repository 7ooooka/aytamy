import 'package:aytamy/app/route.dart';
import 'package:aytamy/common/colors.dart';
import 'package:aytamy/common/stats_widgets.dart';
import 'package:aytamy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../app/app_model.dart';
import '../signup/provider/registrationModel.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RegistrationModel _registrationModel = RegistrationModel();
  final _app = AppModel();
  Widget build(BuildContext context) {
    print("IntroScreen ---> Build()");
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.red),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, size: 22, color: rustRed),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * .80,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.red, width: 1.7)),
                        child: TextFormField(
                          controller: _userNameController,
                          autovalidateMode: AutovalidateMode.always,
                          style: TextStyle(
                              color: const Color(0xffdb0011),
                              fontWeight: FontWeight.w900,
                              fontFamily: "GESSTwoBold",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 14),
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                            // hintText: 'What do people call you?',
                            labelText: S.current.email,
                          ),
                        )),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * .80,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.red, width: 1.7)),
                        child: TextFormField(
                          controller: _passwordController,
                          autovalidateMode: AutovalidateMode.always,
                          style: TextStyle(
                              color: const Color(0xffdb0011),
                              fontWeight: FontWeight.w900,
                              fontFamily: "GESSTwoBold",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 14),
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.red,
                            ),
                            // hintText: 'What do people call you?',
                            labelText: S.of(context).password,
                          ),
                        )),

                    SizedBox(
                      height: 22,
                    ),
                    // Rectangle
                    InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .80,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffdb0011)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 22,
                            ),
                            Text(S.current.enter,
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
                      onTap: () {
                        if (validateForm()) {
                          showLoading(context);
                          _registrationModel.loginUser(
                              email: _userNameController.value.text,
                              password: _passwordController.value.text,
                              onSuccess: () {
                                _app.setIsUserLoggedIn(true);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    Routes.HOME, (route) => false);
                                dismissLoading();
                              },
                              onError: (errorResponse) {
                                showError(errorResponse);
                                dismissLoading();
                              });
                        }
                      },
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    // Rectangle
                    InkWell(
                      onTap: () {
                        showLoading(context);
                        _registrationModel.signInWithFacebook(
                            onSucces: (email) {
                          print("fafafafa" + email);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.HOME, (route) => false);
                          dismissLoading();
                        }, onError: (errorResponse) {
                          showError(errorResponse);
                          dismissLoading();
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .80,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Color(0xff0078d7), width: 1.7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 22,
                            ),
                            Text(S.current.signUpFaceBook,
                                style: const TextStyle(
                                    color: const Color(0xff0078d7),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "GESSTwoBold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                            Container(
                              margin: EdgeInsets.only(left: 18),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    // Rectangle
                    InkWell(
                      onTap: () {
                        showLoading(context);
                        _registrationModel.signInWithGoogle(onSucces: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.HOME, (route) => false);
                          dismissLoading();
                        }, onError: (errorResponse) {
                          showError(errorResponse);
                          dismissLoading();
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .80,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Color(0xffdb0011), width: 1.7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 22,
                            ),
                            // كلمة المرور
                            Text(S.current.signUpGoogle,
                                style: TextStyle(
                                    color: Color(0xffdb0011),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "GESSTwoBold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                            Container(
                              margin: EdgeInsets.only(left: 18),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 42,
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
                            text: S.current.joinUs + " ",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(Routes.SIGN_UP);
                              }),
                        TextSpan(
                            style: const TextStyle(
                                color: const Color(0xff4f4f4f),
                                fontWeight: FontWeight.w700,
                                fontFamily: "GESSTwoBold",
                                fontStyle: FontStyle.normal,
                                fontSize: 18.0),
                            text: S.current.doNotHaveAccount),
                      ])),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                          width: 55,
                          height: 0,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xff4f4f4f), width: 2))),
                      SizedBox(
                        height: 12,
                      ),
                      // Forgot password?
                      Text(S.current.forgotPassword,
                          style: const TextStyle(
                              color: const Color(0xff4f4f4f),
                              fontWeight: FontWeight.w900,
                              fontFamily: "GESSTwoBold",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  bool validateForm() {
    if (_userNameController.value.text.isEmpty) {
      showError(S.current.invalidUserName);
      return false;
    } else if (_passwordController.value.text.isEmpty &&
        _passwordController.value.text.length < 6) {
      showError(S.current.invalidPassword);
      return false;
    }
    return true;
  }
}
