/*import 'package:event_bus/event_bus.dart';*/

/// enable network proxy
const debugNetworkProxy = false;

/// some constants Local Key
const kLocalKey = {
  "userInfo": "userInfo",
  "shippingAddress": "shippingAddress",
  "recentSearches": "recentSearches",
  "wishlist": "wishlist",
  "home": "home",
  "cart": "cart"
};

/// Logging config
const kLOG_TAG = "[Denish 007]";
const kLOG_ENABLE = true;

printLog(dynamic data) {
  if (kLOG_ENABLE) {
    print("[${DateTime.now().toUtc()}]$kLOG_TAG${data.toString()}");
  }
}

/// check if the environment is web
const bool kIsWeb = identical(0, 0.0);

/*/// use eventbus for fluxbuilder
EventBus eventBus = EventBus();*/

/// constant for Magento payment
const kMagentoPayments = [
  "HyperPay_Amex",
  "HyperPay_ApplePay",
  "HyperPay_Mada",
  "HyperPay_Master",
  "HyperPay_PayPal",
  "HyperPay_SadadNcb",
  "HyperPay_Visa",
  "HyperPay_SadadPayware"
];

const ApiPageSize = 20;

/// Use for set default SMS Login
class LoginSMSConstants {
  static const String countryCodeDefault = 'IN';
  static const String dialCodeDefault = '+91';
  static const String nameDefault = 'India';
}
