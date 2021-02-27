import 'package:aytamy/app/route.dart';
import 'package:aytamy/common/colors.dart';
import 'package:aytamy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  Widget build(BuildContext context) {
    print("SignUpScreen ---> Build()");
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
                Image.asset(
                  "assets/logo.png",
                  height: MediaQuery.of(context).size.height * .35,
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
                            labelText: S.current.userName,
                          ),
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          validator: (String value) {
                            return value.contains('@')
                                ? 'Do not use the @ char.'
                                : null;
                          },
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
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          validator: (String value) {
                            return value.contains('@')
                                ? 'Do not use the @ char.'
                                : null;
                          },
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
                          onSaved: (String value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          validator: (String value) {
                            return value.contains('@')
                                ? 'Do not use the @ char.'
                                : null;
                          },
                        )),

                    SizedBox(
                      height: 22,
                    ),
                    // Rectangle
                    Container(
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
                          InkWell(
                            child: Text(S.current.signUp,
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "GESSTwoBold",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 21.0),
                                textAlign: TextAlign.left),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.SIGN_UP_STEP_ONE);
                            },
                          ),
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
                      height: 22,
                    ),
                    // Rectangle
                    Container(
                      width: MediaQuery.of(context).size.width * .80,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Color(0xff0078d7), width: 1.7)),
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
                    SizedBox(
                      height: 22,
                    ),
                    // Rectangle
                    Container(
                      width: MediaQuery.of(context).size.width * .80,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(color: Color(0xffdb0011), width: 1.7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 22,
                          ),
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
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: const TextStyle(
                          color: const Color(0xffff6a00),
                          fontWeight: FontWeight.w500,
                          fontFamily: "GESSTwoMedium",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                      text: S.current.alreadyHaveAccount + " "),
                  TextSpan(
                      style: const TextStyle(
                          color: const Color(0xff4f4f4f),
                          fontWeight: FontWeight.w500,
                          fontFamily: "GESSTwoMedium",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                      text: S.current.register)
                ])),
                SizedBox(
                  height: 24,
                ),
              ],
            )),
      ),
    );
  }
}
