import 'package:aytamy/common/exception_indicators/empty_list_indicator.dart';
import 'package:aytamy/common/model/User.dart';
import 'package:aytamy/screens/home/provider/home_model.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import 'case_item_view.dart';

class SearchListView extends StatefulWidget {
  String value;

   SearchListView({Key key, this.value}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SearchListViewState();
  }
}

class _SearchListViewState extends State<SearchListView> {
  User user;
  PageController _pagingController = new PageController(
    initialPage: 0,
    viewportFraction: 0.75,
  );

  @override
  void initState() {
    super.initState();
    Provider.of<HomeModel>(context, listen: false).getSearchResult(widget.value);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        Future.delayed(Duration(milliseconds: 600), () {
          _pagingController.jumpToPage(1);
          _pagingController.jumpToPage(0);
        });
      } catch (error) {}
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModel>(
      builder: (context, homeModel, child) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            ListView(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: renderMostRecentUsers(homeModel.SearchUsers)),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget renderMostRecentUsers(List<User> mostRecentUser) {
    return PageView.builder(
        itemCount: mostRecentUser.length,
        controller: _pagingController,
        itemBuilder: (BuildContext context, int index) {
          return
            mostRecentUser!=null?
            CaseItemView(index: index,):Text("Loading...");
        },
        onPageChanged: (x) {
  });
}
}
