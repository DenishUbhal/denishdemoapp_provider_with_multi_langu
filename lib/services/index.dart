import 'package:denishdemoapp/model/user/user.dart';
import 'package:denishdemoapp/services/api_service.dart';

import 'config.dart';

abstract class BaseServices {
  //account/GetLoginDetails
  /*Future<List<Category>> getCategories({lang});*/
  Future<User> login({String mobileNo});
}

class Services implements BaseServices {
  BaseServices serviceApi;

  static final Services _instance = Services._internal();

  factory Services() => _instance;

  Services._internal();

  void setAppConfig(appConfig) {
    print("[Services] setAppConfig: --> ${appConfig["type"]} <--");
    Config().setConfig(appConfig);
    //CartInject().init(appConfig);
    ApiServices().setAppConfig(appConfig);
    serviceApi = ApiServices();
  }

  @override
  Future<User> login({String mobileNo}) {
    return serviceApi.login(mobileNo: mobileNo);
  }

/*@override
  Future<bool> addtoCart({product}) {
    return serviceApi.addtoCart(
        product: product
    );
  }*/
}
