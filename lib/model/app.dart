import 'package:denishdemoapp/common/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel with ChangeNotifier {
  Map<String, dynamic> appConfig;
  bool isLoading = true;
  String message;
  bool darkTheme = false;

  //String locale = kAdvanceConfig['DefaultLanguage'];
  String locale = kAdvanceConfig['DefaultLanguage'];
  List<String> categories;
  String productListLayout;
  String currency; //USD, VND
  bool showDemo = false;
  String username;
  bool isInit = false;
  Map<String, dynamic> drawer;

  AppModel() {
    getConfig();
  }

  Future<bool> getConfig() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      locale = prefs.getString("language") ?? kAdvanceConfig['DefaultLanguage'];
      darkTheme = prefs.getBool("darkTheme") ?? false;
      /*currency = prefs.getString("currency") ??
          (kAdvanceConfig['DefaultCurrency'] as Map)['currency'];*/
      isInit = true;
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> changeLanguage(String country, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      locale = country;
      await prefs.setString("language", country);
      //await loadAppConfig();
      notifyListeners();
      return true;
    } catch (err) {
      return false;
    }
  }
}
