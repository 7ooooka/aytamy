import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/home_model.dart';

class CaseItemView extends StatefulWidget {
  int index;

  CaseItemView({this.index});

  @override
  State<StatefulWidget> createState() {
    return _CaseItemViewState();
  }
}

class _CaseItemViewState extends State<CaseItemView>
    with TickerProviderStateMixin {
  bool state = false;
  HomeModel homelModel;

  double scale = 3.3;
  bool shouldScaleDown = false; //
  @override
  void initState() {
    homelModel = Provider.of<HomeModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = 200.0;
    final height = 300.0;

    return GestureDetector(
      child: Container(
        alignment: Alignment.center,

        decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Provider.of<HomeModel>(context).currentSelectedRecentUser ==
                    homelModel.mostRecentUsers[widget.index]
                ? Border.all(color: Colors.red)
                : Border.all(color: Colors.black87, width: 1.6)),
        margin: EdgeInsets.only(left: 16),
        child: Container(

          // AnimatedContainer(
          // duration: Duration(milliseconds: 200),
          // transform: (Provider.of<HomeModel>(context)
          //             .currentSelectedRecentUser ==
          //         homelModel.mostRecentUsers[widget.index]
          //     ? Matrix4.identity()
          //     // scale with to 95% anchorred at topleft of the AnimatedContainer
          //     : (Matrix4.identity()
          //       ..translate(0.025 * width,
          //           0.025 * height) // translate towards right and down
          //       ..scale(0.95, 0.95))),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(

                    child:
                        homelModel.mostRecentUsers[widget.index].image != null
                            ? Image.network(
                                homelModel.mostRecentUsers[widget.index].image,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              )
                            : Image.asset(
                                "assets/images/hci_adventures.jpg",
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 135,
                        height: 35,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          width: 134,
                          height: 27,
                          decoration: new BoxDecoration(
                              color: Color(0xffff6a00),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14),
                                  bottomLeft: Radius.zero)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Image.asset(
                                "assets/icons/bookmark.png",
                                height: 30,
                                color: Colors.white,
                              ),
                              SizedBox(width: 16),
                              Text(
                                  homelModel.mostRecentUsers[widget.index]
                                              .warranty ==
                                          0
                                      ? "كفالة مادية"
                                      : "كفالة اجتماعية",
                                  style: TextStyle(
                                    fontFamily: 'GESSTwo',
                                    color: Color(0xffffffff),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          color: Color(0xfff5f5f5),
                          height: 45,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Color(0xff9e9e9e),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      homelModel
                                          .mostRecentUsers[widget.index].name
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: 'GESSTwo',
                                        color: Color(0xff4f4f4f),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                      )),
                                ],
                              ),
                              new Image.asset(
                                "assets/icons/find.png",
                                height: 30,
                                color: Color(0xff9e9e9e),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              )),
        ),
      ),
      onTap: () {
        print(shouldScaleDown.toString());
        shouldScaleDown = !shouldScaleDown;
        homelModel.setCurrentSelectedRecentUser(
            homelModel.mostRecentUsers[widget.index]);

        setState(() {});
      },
    );
  }
}
