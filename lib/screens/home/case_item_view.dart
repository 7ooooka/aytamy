import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/home_model.dart';

class CaseItemView extends StatefulWidget {
  int index;

  CaseItemView({Key key, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CaseItemViewState();
  }
}

class _CaseItemViewState extends State<CaseItemView>
    with TickerProviderStateMixin {
  bool state = false;
  HomeModel homelmodel;
  double _scaleFactor = 3.0;
  double _baseScaleFactor = 1.0;
  double scale = 3.3;
  bool shouldScaleDown = false; //
  @override
  void initState() {
    homelmodel = Provider.of<HomeModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("indexxx" + homelmodel.mostRecentUsers[widget.index].name.toString());
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    final width = 200.0;
    final height = 300.0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: AnimatedContainer(
          width: width,
          height: height,
          duration: Duration(milliseconds: 200),
          transform: (shouldScaleDown
              ? (Matrix4.identity()
                ..translate(0.025 * width,
                    0.025 * height) // translate towards right and down
                ..scale(0.95,
                    0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
              : Matrix4.identity()),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      decoration: new BoxDecoration(
                          color: Color(0xfff5f5f5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          homelmodel.mostRecentUsers[widget.index].image != null
                              ? Image.network(
                                  homelmodel
                                      .mostRecentUsers[widget.index].image,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                )
                              : Image.asset(
                                  "assets/images/hci_adventures.jpg",
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                new Container(
                                  width: 135,
                                  height: 30,
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    width: 134,
                                    height: 27,
                                    decoration: new BoxDecoration(
                                        color: Color(0xffff6a00)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        new Text(
                                            homelmodel
                                                        .mostRecentUsers[
                                                            widget.index]
                                                        .warranty ==
                                                    0
                                                ? "كفالة مادية"
                                                : "كفالة اجتماعية",
                                            style: TextStyle(
                                              fontFamily: 'GESSTwo',
                                              color: Color(0xffffffff),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                            )),
                                        SizedBox(width: 30),
                                        Icon(
                                          Icons.save_outlined,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                      color: Color(0xfff5f5f5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xff9e9e9e),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Text(
                                  homelmodel.mostRecentUsers[widget.index].name
                                      .toString(),
                                  style: TextStyle(
                                    fontFamily: 'GESSTwo',
                                    color: Color(0xff4f4f4f),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.favorite,
                                color: Color(0xff9e9e9e),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              )),
        ),
        onTap: () {
          print(shouldScaleDown.toString());
          shouldScaleDown = !shouldScaleDown;
          setState(() {});
        },
      ),
    );
  }
}
