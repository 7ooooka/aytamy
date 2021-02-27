import 'package:aytamy/app/route.dart';
import 'package:aytamy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("IntroScreen ---> Build()");
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 22,
            ),
            Image.asset(
              "assets/logo.png",
              height: MediaQuery.of(context).size.height * .45,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .80,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: const Color(0xff4f4f4f), width: 1.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(S.current.soon,
                          style: const TextStyle(
                              color: const Color(0xffff6a00),
                              fontWeight: FontWeight.w600,
                              fontFamily: "GESSTwoMedium",
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0)),
                      Text(S.current.text_1,
                          style: TextStyle(
                              color: const Color(0xff4f4f4f),
                              fontWeight: FontWeight.w900,
                              fontFamily: "GESSTwoBold",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0)),
                      Icon(Icons.error)
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .80,
                  height: 45,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .37,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                                color: const Color(0xffdb0011), width: 1.5)),
                        child: // كلمة المرور
                            Text(
                          S.of(context).login,
                          style: const TextStyle(
                              color: const Color(0xffdb0011),
                              fontWeight: FontWeight.w700,
                              fontFamily: "GESSTwoBold",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                      // Rectangle
                      Container(
                        width: MediaQuery.of(context).size.width * .37,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: const Color(0xffdb0011)),
                        child: // كلمة المرور
                            Text(
                          S.current.signUp,
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              fontFamily: "GESSTwoBold",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
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
                        // كلمة المرور
                        Text(S.current.explore,
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                fontFamily: "GESSTwoBold",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
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
                    Navigator.of(context).pushNamed(Routes.LOGIN);
                  },
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
                  Icon(
                    Icons.shield,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    S.current.copyRight,
                    style: const TextStyle(
                        color: const Color(0xff4f4f4f),
                        fontWeight: FontWeight.w700,
                        fontFamily: "GESSTwoBold",
                        fontStyle: FontStyle.normal,
                        fontSize: 21.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  // Forgot password?
                  Text(S.current.copyRight_2,
                      style: const TextStyle(
                          color: const Color(0xff4f4f4f),
                          fontWeight: FontWeight.w300,
                          fontFamily: "GESSTwoLight",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.0),
                      textAlign: TextAlign.center)
                ],
              ),
            ),
          ],
        ));
  }
}
