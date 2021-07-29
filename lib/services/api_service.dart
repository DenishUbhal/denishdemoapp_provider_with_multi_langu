import 'dart:async';
import 'dart:convert' as convert;
import 'dart:convert';

import 'package:denishdemoapp/model/user/user.dart';
import 'package:http/http.dart' as http;

import './index.dart';
import '../common/constants.dart';

class ApiServices implements BaseServices {
  static final ApiServices _instance = ApiServices._internal();

  factory ApiServices() => _instance;

  ApiServices._internal();

  String cookie;
  String domain;

  @override
  void setAppConfig(appConfig) {
    domain = appConfig["url"];
    print(domain);
    //getCookie();
  }

  @override
  Future<User> login({String mobileNo}) async {
    try {
      var url = "$domain/account/GetLoginDetails";
      print("Login = " + url);
      var response = await http.post(Uri.parse(url),
          body: convert.jsonEncode({"MobileNumber": mobileNo, "FCMToken": ""}),
          headers: {"content-type": "application/json", "cookie": cookie});
      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var item in body["data"]) {
          return User.fromJson(item);
        }
        return null;
      } else {
        List error = body["error"];
        if (error != null && error.isNotEmpty) {
          throw Exception(error[0]);
        } else {
          throw Exception("No match for E-Mail Address and/or Password");
        }
      }
    } catch (err) {
      rethrow;
    }
  }

/*Future<void> getCookie() async {
    final LocalStorage storage = LocalStorage("fstore");
    try {
      final ready = await storage.ready;
      if (ready) {
        final json = storage.getItem("opencart_cookie");
        if (json != null) {
          cookie = json;
        } else {
          cookie = "OCSESSID=" +
              randomNumeric(30) +
              "; PHPSESSID=" +
              randomNumeric(30);
          await storage.setItem("opencart_cookie", cookie);
        }
      }
    } catch (err) {
      print(err);
      cookie =
          "OCSESSID=" + randomNumeric(30) + "; PHPSESSID=" + randomNumeric(30);
    }
  }*/

//denish cat
/*@override
  Future<List<Category>> getCategories({lang}) async {
    try {
      var response = await http.get(
          "$domain/index.php?route=extension/mstore/category&limit=100&lang=$lang");
      print(
          "Get Categories  API URL = $domain/index.php?route=extension/mstore/category&limit=100&lang=$lang");
      List<Category> list = [];
      if (response.statusCode == 200) {
        for (var item in convert.jsonDecode(response.body)["data"]) {
          list.add(Category.fromOpencartJson(item));
        }
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }*/

/*@override
  Future<List> getMyStatus() async {
    try {
      var urlCall =
          "$domain/index.php?route=extension/mstore/order/ordestatuses";
      var response = await http.post(urlCall,
          headers: {"content-type": "application/json", "cookie": cookie});
      print("ordestatuses API URL = $urlCall");
      List list = [];
      if (response.statusCode == 200) {
        for (var item in convert.jsonDecode(response.body)["data"]) {
          list.add(item);
        }
      }
      return list;
    } catch (err) {
      rethrow;
    }
  }*/

/*@override
  Future<List<PaymentMethod>> getPaymentMethods(
      {Address address, ShippingMethod shippingMethod, String token}) async {
    try {
      List<PaymentMethod> list = [];
      var response = await http.post(
          "$domain/index.php?route=extension/mstore/shipping_method/save",
          body: convert.jsonEncode(
              {"shipping_method": shippingMethod.id, "comment": "no comment"}),
          headers: {"content-type": "application/json", "cookie": cookie});
      final body = convert.jsonDecode(response.body);
      print("Saving Shipping Method");
      print(body);

      if (response.statusCode == 200 && body["success"] == 1) {
        response = await http.post(
            "$domain/index.php?route=extension/mstore/payment_address/save",
            body: convert.jsonEncode(
              address.toOpencartJson(shippingMethod.id.toString()),
              //address.toOpencartJson(),
              //{"":""},
            ),
            headers: {"content-type": "application/json", "cookie": cookie});
        final body = convert.jsonDecode(response.body);
        if (response.statusCode == 200 && body["success"] == 1) {
          var res = await http.get(
              "$domain/index.php?route=extension/mstore/payment_method",
              headers: {"cookie": cookie});
          final body = convert.jsonDecode(res.body);
          if (res.statusCode == 200 && body["data"]["error_warning"] == "") {
            Map<String, dynamic> data = body["data"]["payment_methods"];
            for (var item in data.values.toList()) {
              list.add(PaymentMethod.fromOpencartJson(item));
            }
            print("Saving Payment Method");
            print(list);
            return list;
          } else {
            throw Exception(body["data"]["error_warning"]);
          }
        } else {
          throw Exception(body["error"][0]);
        }
      } else {
        throw Exception(body["error"][0]);
      }
    } catch (e) {
      rethrow;
    }
  }*/

}
