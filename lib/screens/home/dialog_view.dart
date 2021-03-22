
import 'package:aytamy/common/widgets/slide_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



addPayDialogView<T>(
    {@required BuildContext context,
      Color barrierColor,
      bool barrierDismissible = false,
      Duration transitionDuration = const Duration(milliseconds: 300),
      Color pillColor,
      String message,
      Color backgroundColor,
      Function onChangePasswordClick}) {
  assert(context != null);

  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation1, animation2) {},
    barrierColor: barrierColor ?? Colors.black.withOpacity(0.7),
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    transitionDuration: transitionDuration,
    transitionBuilder: (context, animation1, animation2, widget) {
      final curvedValue = Curves.easeInOut.transform(animation1.value) - 1.0;
      return GestureDetector(
        child: Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -300, 0.0),
          child: Opacity(
            opacity: animation1.value,
            child: SingleChildScrollView(
              child: SlideDialog(
                  heightRatio: 1.55,
                  pillColor: pillColor ?? Colors.blueGrey[200],
                  backgroundColor:
                  backgroundColor ?? Theme.of(context).canvasColor,
                  child: PayDialogView()),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}

class PayDialogView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PayDialogViewState();
  }
}

class _PayDialogViewState extends State<PayDialogView> {
  int currentSum = 10;
  int currentQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(" التبرع للوجبة الواحدة بــ ${currentSum.toString()}   دولار",
              style: const TextStyle(
                  color: const Color(0xffdb0011),
                  fontWeight: FontWeight.w700,
                  fontFamily: "GESSTwo",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.right),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Container(
                  width: 35,
                  height: 35,
                  color: Colors.red,
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      iconSize: 150,
                      onPressed: () {
                        setState(() {
                          currentSum = currentSum + 10;
                          currentQuantity++;
                        });
                      },
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  currentSum.toString() + " \$ ",
                  style: TextStyle(
                    color: const Color(0xffdb0011),
                    fontWeight: FontWeight.w800,
                    fontFamily: "Montserrat",
                    fontSize: 22,
                    decoration: TextDecoration.underline,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              ClipOval(
                child: Container(
                  width: 35,
                  height: 35,
                  color: Colors.red,
                  alignment: Alignment.topCenter,
                  child: FittedBox(
                    child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      iconSize: 150,
                      onPressed: () {
                        if (currentSum > 10) {
                          setState(() {
                            currentSum = currentSum - 10;
                            currentQuantity--;
                          });
                        }
                        // widget.onRemoveQuantity(product.id);
                      },
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(" قيمه " + currentQuantity.toString() + " وجبه",
              style: TextStyle(
                  color: const Color(0xffdb0011),
                  fontWeight: FontWeight.w800,
                  fontFamily: "GESSTwo",
                  fontStyle: FontStyle.normal,
                  fontSize: 18.0)),
          SizedBox(
            height: 12,
          ),
          // Rectangle 49
          Container(
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
                  color: Colors.red, borderRadius: BorderRadius.circular(16)))
        ],
      ),
    );
  }
}


