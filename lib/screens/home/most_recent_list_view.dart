import 'package:aytamy/common/exception_indicators/empty_list_indicator.dart';
import 'package:aytamy/common/model/User.dart';
import 'package:aytamy/screens/home/provider/home_model.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import 'case_item_view.dart';

class MostRecentListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MostRecentListViewState();
  }
}

class _MostRecentListViewState extends State<MostRecentListView> {
  final _pagingController = PagingController<int, User>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    // _pagingController.addPageRequestListener((pageKey) {
    //   _fetchPage(pageKey);
    // });
    Provider.of<HomeModel>(context, listen: false).getMostRecentUsers();
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    final nextPageKey = pageKey + 1;
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
    if (mostRecentUser != null) {
      if (mostRecentUser.isEmpty) {
        _pagingController.itemList = [];
      } else {
        _pagingController.appendLastPage(mostRecentUser);
      }
    }
    return PagedGridView(
      pagingController: _pagingController,

      builderDelegate: PagedChildBuilderDelegate<User>(
        itemBuilder: (context, user, index) {
          return CaseItemView();
        },
        firstPageProgressIndicatorBuilder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
        firstPageErrorIndicatorBuilder: (context) => EmptyListIndicator(),
        noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
      ),
      padding: const EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
