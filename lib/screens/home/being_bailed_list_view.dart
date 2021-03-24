import 'package:aytamy/common/exception_indicators/empty_list_indicator.dart';
import 'package:aytamy/common/model/User.dart';
import 'package:aytamy/screens/home/provider/home_model.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import 'case_item_view.dart';

class BeingBailedListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BeingBailedListViewState();
  }
}

class _BeingBailedListViewState extends State<BeingBailedListView> {
  User user;
  PageController _pagingController = new PageController(
    initialPage: 0,
    viewportFraction: 0.85,
  );

  @override
  void initState() {
    super.initState();
    Provider.of<HomeModel>(context, listen: false).getBeingBailedUsers();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        Future.delayed(Duration(milliseconds: 600), () {
          _pagingController.jumpToPage(1);
          _pagingController.jumpToPage(0);
        });
      } catch (error) {}
    });
  }

  // Future<void> _fetchPage(int pageKey) async {
  //   final nextPageKey = pageKey + 1;
  // }

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
                  Container(
                      height: MediaQuery.of(context).size.height *.28,
                      child: renderMostRecentUsers(homeModel.mostRecentUsers)),
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
    // if (mostRecentUser != null) {
    //   if (mostRecentUser.isEmpty) {
    //     _pagingController.itemList = [];
    //   } else {
    //     _pagingController.appendLastPage(mostRecentUser);
    //     if (mostRecentUser!=null){
    //       print(mostRecentUser.length.toString() + "lenghththth");
    //     }
    //   }
    // }
    return PageView.builder(
        itemCount: mostRecentUser.length,
        controller: _pagingController,
        itemBuilder: (BuildContext context, int index) {
          return
            mostRecentUser!=null?
            CaseItemView(index: index,):Text("Loading...");
        },
        onPageChanged: (x) {
/*    setState(() {
    selectedSubject = subjects.docs[x].id;
    selectedSubjectTitle =
    subjects.docs[x].data()['name'];
    });*/
        });

    /*PagedGridView(
      pagingController: _pagingController,
      scrollDirection: Axis.vertical,
      builderDelegate: PagedChildBuilderDelegate<User>(
        itemBuilder: (context, user, index) {
          return
            mostRecentUser!=null?
            CaseItemView(index: index,):Text("Loading...");
        },
        firstPageProgressIndicatorBuilder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
        firstPageErrorIndicatorBuilder: (context) => EmptyListIndicator(),
        noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
      ),
      padding: const EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );*/

    @override
    void dispose() {
      _pagingController.dispose();
      super.dispose();
    }
  }
}
