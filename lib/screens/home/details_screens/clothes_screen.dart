import 'package:aytamy/common/colors.dart';
import 'package:aytamy/screens/home/add_pay_dialog_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClothesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClothesScreenState();
  }
}

class _ClothesScreenState extends State<ClothesScreen> {
  CurrentSelectedOption _currentSelectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image.asset(
                    "assets/images/T-Shirt copy.png",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .38,
                    fit: BoxFit.cover,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*.11,
                      child: new Image.asset(
                        "assets/icons/cancel.png",
                        color: Colors.red,
                      ),
                    ),
                  ),

                ]),
            LinearProgressIndicator(
              value: .3,
              backgroundColor: Color(0xffbdbdbd),
              valueColor: new AlwaysStoppedAnimation<Color>(rustRed),
              minHeight: 6,
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.add,
                  color: Colors.red,
                ),
                new Text("بنك الملابس",
                    style: TextStyle(
                      fontFamily: 'GESSTwo',
                      color: Color(0xffdb0011),
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: -0.23571428871154784,
                    )),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  new Text(
                      "مراعاة لظروف الأيتام وتخفيضاً عنهم نسعى من خلال تطبيق أيتام  إلى توفير قطع ملابس جديدة للأيتام المسجلين لدينا من خلال بنك الملابس.",
                      style: TextStyle(
                        fontFamily: 'GESSTwo',
                        color: Color(0xff4f4f4f),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.19285714530944825,
                      )),
                  new Text(
                      "بنك الملابس هو أحد بنوك أيتام حيث نقوم باستقبال الملابس الجديدة لنعيد ترتيبها وإرسالها إلى أيتامنا مباشرة من خلال وكلائنا في جميع البلاد المتاح فيها إدراج أيتامهم والمتحقق من يتمهم من قبل أخصائيين مكلفين بالتحقق من حالات اليتم.",
                      style: TextStyle(
                        fontFamily: 'GESSTwo',
                        color: Color(0xff4f4f4f),
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.19285714530944825,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  // Rectangle 49
                  GestureDetector(
                    child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        height: 55,
                        alignment: Alignment.center,
                        child: // تبرع
                            Text("تبرع",
                                style: const TextStyle(
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "GESSTwo",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22.0),
                                textAlign: TextAlign.center),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16))),
                    onTap: () {
                      addPayDialogView(context: context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum CurrentSelectedOption { OPTION_ONE, OPTION_TWO }
