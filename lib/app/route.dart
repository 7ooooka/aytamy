import 'package:aytamy/screens/home/home_screen.dart';
import 'package:aytamy/screens/intro/intro_screen.dart';
import 'package:aytamy/screens/login/login_screen.dart';
import 'package:aytamy/screens/signup/registration_info/registration_info_screen_final.dart';
import 'package:aytamy/screens/signup/registration_info/registration_info_step_one_screen.dart';
import 'package:aytamy/screens/signup/registration_info/registration_info_screen_step_two.dart';
import 'package:aytamy/screens/signup/registration_info/registration_info_screen_three.dart';
import 'package:aytamy/screens/signup/signup_screen.dart';
import 'package:aytamy/screens/home/details_screens/food_screen.dart';
import 'package:aytamy/screens/home/details_screens/treatement_sceen.dart';
import 'package:aytamy/screens/home/details_screens/clothes_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getAll() => _routes;

  static const INTO_SCREEN = "/intro_screen";

  static const SIGN_UP = "/SignUpScreen";
  static const LOGIN = "/loginScreen";
  // static const FORGOT_PASSWORD = "/forgot_password";
  static const HOME = "/home_screen";
   static const REGISTRATION_INFO_SCREEN_STEP_ONE = "/registration_info_screen_step_one";
   static const REGISTRATION_INFO_SCREEN_STEP_TWO= "/registration_info_screen_step_two";
  static const REGISTRATION_INFO_SCREEN_FINAL_SCREEN = "/registration_info_final";
  static const REGISTRATION_INFO_SCREEN_THIRD_SCREEN = "/registration_info_screen_three";
  static const USER_INFO_SCREEN = "/user_info_screen";
  static const FOOD_SCREEN = "/food_screen";
  static const TREATEMENT_SCREEN = "/treatement_screen";
  static const CLOTHES_SCREEN = "/clothes_screen";



  // static const SERVICE_FEATURES = "/service_features";
  // static const SUB_SERVICE_FEATURES = "/sub_service_features";
  // static const CART = "/cart";
  // static const ADDRESS_FORM_SCREEN = "/address_form_screen";
  // static const ADDRESS_LIST_SCREEN = "/address_list_screen";
  // static const PAYMENT_SCREEN = "/payment_screen";
  // static const TRANSACTION_SUBMIT_SCREEN = "/transaction_submit_screen";
  // static const TRANSACTION_SCREEN = "/transaction_screen";
  // static const PROFILE_SCREEN = "/profile_screen";

  static final Map<String, WidgetBuilder> _routes = {
    INTO_SCREEN: (context) => IntroScreen(),
    LOGIN: (context) => LoginScreen(),
    SIGN_UP: (context) => SignUpScreen(),
    REGISTRATION_INFO_SCREEN_STEP_ONE: (context) => RegistrationInfoStepOneScreen(),
    REGISTRATION_INFO_SCREEN_STEP_TWO: (context) => RegistrationInfoStepTwoScreen(),
    REGISTRATION_INFO_SCREEN_FINAL_SCREEN: (context) => RegistrationInfoFinalScreen(),
    HOME: (context) => HomeScreen(),
    FOOD_SCREEN:(context) => FoodScreen(),
    TREATEMENT_SCREEN:(context) => treatementScreen(),
    CLOTHES_SCREEN:(context) => ClothesScreen(),
    REGISTRATION_INFO_SCREEN_THIRD_SCREEN:(context) => RegistrationInfoStepThreeScreen(),
    // SIGN_UP_SUCCESS: (context) => SignUpSuccessScreen(),
    // FORGOT_PASSWORD: (context) => ForgotPasswordScreen(),
    // LOGIN: (context) => LoginScreen(),
    // ON_BOARDING: (context) => OnBoardingScreen(),
    // SERVICE_FEATURES: (context) => ServiceFeaturesScreen(),
    // SUB_SERVICE_FEATURES: (context) => SubServicesFeaturesScreen(),
    // CART: (context) => CartScreen(),
    // ADDRESS_FORM_SCREEN: (context) => AddressFormScreen(),
    // ADDRESS_LIST_SCREEN: (context) => AddressListScreen(),
    // PAYMENT_SCREEN: (context) => SubmitTransactionScreen(),
    // TRANSACTION_SUBMIT_SCREEN: (context) => TransactionSubmittedScreen(),
    // TRANSACTION_SCREEN: (context) => TransactionScreen(),
    // PROFILE_SCREEN: (context) => ProfileScreen(),
  };

// todo add this attribute to main Appwidget  ---> onGenerateRoute: Routes.getRouteGenerate, of Main app widget
  // static Route getRouteGenerate(RouteSettings settings) =>
  //     _routeGenerate(settings);
  // // handle unNamed route here , or make some initialization for a specific route
  // static Route _routeGenerate(RouteSettings settings) {
  //
  //   switch (settings.name) {
  //     case RouteList.homeSearch:
  //       return _buildRouteFade(settings, HomeSearchPage());
  //
  //       break;
  //     default:
  //       return _errorRoute();
  //   }
  // }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }

  static PageRouteBuilder _buildRouteFade(
      RouteSettings settings, Widget builder) {
    return _FadedTransitionRoute(
      settings: settings,
      widget: builder,
    );
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  final RouteSettings settings;

  _FadedTransitionRoute({this.widget, this.settings})
      : super(
            settings: settings,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: const Duration(milliseconds: 100),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
                child: child,
              );
            });
}
