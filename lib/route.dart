import 'package:denishdemoapp/screen/SplashScreen.dart';
import 'package:denishdemoapp/screen/login.dart';
import 'package:flutter/material.dart';

import 'common/constants.dart';

class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    "/splash": (context) => SplashScreen(),
    "/login": (context) => Login(),
    /*"/home-screen": (context) => HomeScreen(),
    "/home": (context) => MainTabs(),
    "/login": (context) => LoginScreen(),
    "/register": (context) => RegistrationScreen(),
    '/products': (context) => ProductsPage(),
    '/wishlist': (context) => WishList(),
    '/checkout': (context) => Checkout(),
    '/orders': (context) => MyOrders(),
    '/blogs': (context) => BlogScreen(),
    '/notify': (context) => NotificationScreen(),
    '/category': (context) => CategoriesScreen(),
    '/search': (context) => SearchScreen(),
    '/setting': (context) => SettingScreen(),
    '/orderReturn':(context) => OrderReturn(),*/
  };

  static Map<String, WidgetBuilder> getAll() => _routes;

  static WidgetBuilder getRouteByName(String name) {
    if (_routes.containsKey(name) == false) {
      return _routes[RouteList.homeScreen];
    }
    return _routes[name];
  }
}
