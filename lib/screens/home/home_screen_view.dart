import 'package:aytamy/generated/l10n.dart';
import 'package:aytamy/screens/home/provider/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'most_recent_list_view.dart';

class HomeScreenView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenViewState();
  }
}

class HomeScreenViewState extends State with SingleTickerProviderStateMixin {
  TabController _tabController;
  HomeModel _homeModel;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _homeModel = HomeModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {},
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          ListView(),
          getMainView(),
        ],
      ),
    );
  }

  Widget getSearchView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: const Color(0xffdb0011)),
            child: Icon(
              Icons.add,
              color: Colors.white,
            )),
        Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(6.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff4f4f4f), width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Color(0xff4f4f4f), width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red, width: 1.5),
              ),
              hintText: S.current.orphanSearch,
              hintStyle: TextStyle(
                color: Color(0xff4f4f4f),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff4f4f4f),
              ),
            ),
          ),
        ),
      ],
    );
  }

  getMainView() {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      child: Column(
        children: [
          getSearchView(),
          Container(
            child: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              indicatorColor: Colors.red,
              unselectedLabelStyle: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'helvetica'),
              tabs: [
                Tab(
                  text: S.current.mostRecent,
                  icon: Icon(Icons.people),
                ),
                Tab(
                  text: S.current.beingBailed,
                  icon: Icon(Icons.person),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            decoration: BoxDecoration(
                //This is for background color
                color: Colors.white.withOpacity(0.0),
                //This is for bottom border that is needed
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.8))),
          ),
          Expanded(
            child: ChangeNotifierProvider.value(
                value: _homeModel,
                child: TabBarView(
                  children: [MostRecentListView(), Text('Person')],
                  controller: _tabController,
                )),
          ),
        ],
      ),
    );
  }
}
