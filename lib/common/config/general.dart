import '../../common/constants.dart';

/// Default app config, it's possible to set as URL
const kAppConfig = 'lib/config/config_en.json';

/// This option is determine hide some components for web
var kLayoutWeb = identical(0, 0.0);

/// The Google API Key to support Pick up the Address automatically
/// We recommend to generate both ios and android to restrict by bundle app id
/// The download package is remove these keys, please use your own key
const kGoogleAPIKey = {
  "android": "your-google-api-key",
  "ios": "your-google-api-key",
  "web": "your-google-api-key"
};

/// user for upgrader version of app, remove the comment from lib/app.dart to enable this feature
/// https://tppr.me/5PLpD
const kUpgradeURLConfig = {
  "android":
      "https://play.google.com/store/apps/details?id=com.kitpot",
  "ios": "https://apps.apple.com/us/app/mstore-flutter/id1469772800"
};

/// use for rating app on store feature
const kStoreIdentifier = {
  "android": "com.kitpot",
  "ios": "1469772800"
};

const kAdvanceConfig = {
  "DefaultLanguage": "en",
  "DetailedBlogLayout": kBlogLayout.halfSizeImageType,
  "EnablePointReward": true,
  "hideOutOfStock": false,
  "EnableRating": true,
  "hideEmptyProductListRating": false,

  /// Show stock Status on product List
  "showStockStatus": true,

  "isCaching": false,

  /// set kIsResizeImage to true if you have finish running Re-generate image plugin
  "kIsResizeImage": false,

  "GridCount": 3,
  "DefaultCurrency": {
    "symbol": "\₹",
    "decimalDigits": 2,
    "symbolBeforeTheNumber": true,
    "currency": "INR"
  },
  "Currencies": [
    {
      "symbol": "\₹",
      "decimalDigits": 2,
      "symbolBeforeTheNumber": true,
      "currency": "INR"
    },
    {
      "symbol": "\$",
      "decimalDigits": 2,
      "symbolBeforeTheNumber": true,
      "currency": "USD"
    },
    {
      "symbol": "đ",
      "decimalDigits": 2,
      "symbolBeforeTheNumber": false,
      "currency": "VND"
    },
    {
      "symbol": "€",
      "decimalDigits": 2,
      "symbolBeforeTheNumber": true,
      "currency": "Euro"
    },
    {
      "symbol": "£",
      "decimalDigits": 2,
      "symbolBeforeTheNumber": true,
      "currency": "Pound sterling"
    },
  ],

  /// Below config is used for Magento store
  "DefaultStoreViewCode": "",
  "EnableAttributesConfigurableProduct": ["color", "size"],
  "EnableAttributesLabelConfigurableProduct": ["color", "size"]
};

const kLoginSetting = {
  "IsRequiredLogin": false,
  'showAppleLogin': true,
  'showFacebook': true,
  'showSMSLogin': true,
  'showGoogleLogin': true,
};

const kDefaultDrawer = {
  "logo": "assets/images/logo.png",
  "background": null,
  "items": [
    {"type": "home", "show": true},
    {"type": "blog", "show": true},
    {"type": "login", "show": true},
    {"type": "category", "show": true}
  ]
};

const kDefaultSettings = [
  'notifications',
  'wishlist',
  /*'language',*/
  /*'currencies',*/
  /*'darkTheme',*/
  'order',
  /*'point',*/
  'rating',
  'privacy',
  'about'
];

const kOneSignalKey = {'appID': '8b45b6db-7421-45e1-85aa-75e597f62714'};
