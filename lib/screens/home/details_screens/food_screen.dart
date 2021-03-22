import 'package:aytamy/common/colors.dart';
import 'package:aytamy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app/route.dart';
import '../../../common/stats_widgets.dart';

class FoodScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FoodScreenState();
  }
}

class _FoodScreenState extends State<FoodScreen> {
  CurrentSelectedOption _currentSelectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/medical-stethoscope-white-surface.png",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .38,
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

       Row(children: [
         Icon(
         Icons.add,
         color: Colors.red,
       ),
         new Text("بنك العلاج",
             style: TextStyle(
               fontFamily: 'GESSTwo',
               color: Color(0xffdb0011),
               fontSize: 22,
               fontWeight: FontWeight.w700,
               fontStyle: FontStyle.normal,
               letterSpacing: -0.23571428871154784,

             )
         ),


       ],),

          SizedBox(
            height: 40,
          ),
          new Text("مراعاة لظروف الأيتام وتخفيضاً عنهم نسعى من خلال تطبيق أيتام إلى توفير عبوات وأدوية للأيتام المسجلين لدينا من خلال بنك العلاج.",
              style: TextStyle(
                fontFamily: 'GESSTwo',
                color: Color(0xff4f4f4f),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.19285714530944825,

              )
          ),
          new Text("بنك العلاج هو أحد بنوك أيتام حيث نقوم باستقبال التبرعات وبناء على قوائم العلاج الخاصة بالأيتام يتم إرسال العبوات إلى أيتامنا مباشرة من خلال وكلائنا في جميع البلاد المتاح فيها إدراج أيتامهم والمتحقق من يتمهم من قبل أخصائيين اجتماعيين مكلفين بالتحقق من حالات اليتم.",
              style: TextStyle(
                fontFamily: 'GESSTwo',
                color: Color(0xff4f4f4f),
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.19285714530944825,

              )
          )

        ],
      ),
    );
  }
}

enum CurrentSelectedOption { OPTION_ONE, OPTION_TWO }
