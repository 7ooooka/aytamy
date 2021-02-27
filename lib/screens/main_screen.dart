import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  var currentTab = 0;

  @override
  Widget build(BuildContext context) {
    print("_MainScreenState ---> called");
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (currentTab == 0) {
            return true;
          } else {
            setState(() {
              currentTab = 0;
            });
            return false;
          }
        },
        child: getNavigationWidget().elementAt(currentTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: getSelectIconsColor(currentTab),
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        items: getNavigationItems(),
      ),
    );
  }

  List<Widget> getNavigationWidget() {
    return [Container(), Container(), Container(), Container(), Container()];
  }

  // getNavigatorItems() {
  //   return Navigator(
  //
  //     onGenerateRoute: (RouteSettings settings) {
  //       WidgetBuilder builder;
  //       // Manage your route Prior Configuration here
  //       switch (settings.name) {
  //         case OptiqueRoutes.MAIN:
  //           builder = (BuildContext context) => HomeScreen();
  //           break;
  //         case OptiqueRoutes.ORDERS:
  //           builder = (BuildContext context) => OrdersScreen();
  //           break;
  //         case OptiqueRoutes.CART:
  //           builder = (BuildContext context) => CartScreen(onBack);
  //           break;
  //         case OptiqueRoutes.WISH_LIST:
  //           builder = (BuildContext context) => WishListScreen();
  //           break;
  //         case OptiqueRoutes.SETTING:
  //           builder = (BuildContext context) => SettingScreen();
  //           break;
  //
  //           break;
  //         default:
  //           builder = (BuildContext context) => HomeScreen();
  //       }
  //       // You can also return a PageRouteBuilder and
  //       // define custom transitions between pages
  //       return MaterialPageRoute(
  //         builder: builder,
  //         settings: settings,
  //       );
  //     },
  //   );
  // }

  List<BottomNavigationBarItem> getNavigationItems() {
    var list = [
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/bottom_navigation_icons/ic_home.png"),
        ),
        activeIcon: ImageIcon(
          AssetImage("assets/bottom_navigation_icons/ic_home_active.png"),
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/bottom_navigation_icons/ic_orders.png"),
        ),
        activeIcon: ImageIcon(
          AssetImage("assets/bottom_navigation_icons/ic_orders_active.png"),
        ),
        label: "Orders",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/bottom_navigation_icons/ic_cart.png"),
        ),
        activeIcon: ImageIcon(
          AssetImage("assets/bottom_navigation_icons/ic_cart_act.png"),
        ),
        label: "Cart",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/bottom_navigation_icons/ic_wish_list.png"),
        ),
        activeIcon: ImageIcon(
          AssetImage("assets/bottom_navigation_icons/ic_wish_list_active.png"),
        ),
        label: "WishList",
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(
            "assets/bottom_navigation_icons/ic_profile.png",
          ),
        ),
        activeIcon: ImageIcon(
          AssetImage("assets/bottom_navigation_icons/ic_profile_active.png"),
        ),
        label: "Setting",
      ),
    ];
    return list;
  }

  Color getSelectIconsColor(int index) {
    switch (index) {
      case 0:
        {
          return Colors.black;
        }
      case 1:
        {
          return Color(0xff24cbb1);
        }
      case 2:
        {
          return Color(0xff9b6aeb);
        }
      case 3:
        {
          return Colors.red;
        }
      case 4:
        {
          return Color(0xff1dabfc);
        }
    }
  }

  onBack() {
    print("action called");
    setState(() {
      currentTab = 0;
    });
  }
}
