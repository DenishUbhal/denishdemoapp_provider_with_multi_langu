import 'package:denishdemoapp/model/user/user.dart';
import 'package:denishdemoapp/services/index.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel with ChangeNotifier {
  bool loading = false;
  User user;
  final Services _service = Services();
  final TextEditingController txtMobileNo = TextEditingController();

  Future<void> login(
      {Function success, Function fail, BuildContext context}) async {
    try {
      if (txtMobileNo.text.isEmpty) {
        var snackBar = SnackBar(content: Text("Please Mobile No Input."));
        Scaffold.of(context).showSnackBar(snackBar);
      } else {
        loading = true;
        final LocalStorage storage = LocalStorage("demo");
        notifyListeners();
        user = await _service.login(
          mobileNo: txtMobileNo.text,
        );
        await saveUser(user);
        await storage.setItem("userDataInfo", user);
        print("MyUser");
        success(user);
        loading = false;
        notifyListeners();
      }
    } catch (err) {
      loading = false;
      fail(err.toString());
      notifyListeners();
    }
  }

  Future<void> saveUser(User user) async {
    final LocalStorage storage = LocalStorage("demo");
    try {
      // save to Preference
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);

      // save the user Info as local storage
      final ready = await storage.ready;
      if (ready) {
        await storage.setItem("userInfo", user);
      }
    } catch (err) {
      print(err);
    }
  }
}
