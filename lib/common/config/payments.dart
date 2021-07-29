/**
 * Everything Config about the Payment
 */

/// config for payment features
const kPaymentConfig = {
  "DefaultCountryISOCode": "IN",

  /// Enable the Shipping optoion from Checkout, support for the Digital Download
  "EnableShipping": true,

  /// Enable the Google Map picker
  "EnableAddress": true,

  /// Enable the product review option
  "EnableReview": true,

  /// enable the google map picker from Billing Address
  'allowSearchingAddress': true,
  "GuestCheckout": false,

  /// Enable Payment option
  "EnableOnePageCheckout": false,
  "NativeOnePageCheckout": true,

  /// Enable Credit card payment
  "EnableCreditCard": false,

  /// Enable update order status to processing after checkout by COD on woo commerce
  "UpdateOrderStatus": false,

  /// Show Refund and Order button on Order Detail
  "EnableRefundCancel": false
};

const Payments = {
  "paypal": "assets/icons/payment/paypal.png",
  "stripe": "assets/icons/payment/stripe.png",
  "razorpay": "assets/icons/payment/razorpay.png",
};

const PaypalConfig = {
  "clientId":
      "ASlpjFreiGp3gggRKo6YzXMyGM6-NwndBAQ707k6z3-WkSSMTPDfEFmNmky6dBX00lik8wKdToWiJj5w",
  "secret":
      "ECbFREri7NFj64FI_9WzS6A0Az2DqNLrVokBo0ZBu4enHZKMKOvX45v9Y1NBPKFr6QJv2KaSp5vk5A1G",
  "production": false,
  "paymentMethodId": "paypal",
  "enabled": true,
  "returnUrl": "http://return.example.com",
  "cancelUrl": "http://cancel.example.com",
};

const RazorpayConfig = {
  "keyId": "rzp_live_Aj4KXjhxCtsyDf",
  "SecretKey": "GFgcB4cRGUQpSFrLTvKzUNzP",
  "paymentMethodId": "razorpay",
  "enabled": true
};

//denish set payment key
const TapConfig = {
  "SecretKey": "GFgcB4cRGUQpSFrLTvKzUNzP",
  "RedirectUrl": "http://your_website.com/redirect_url",
  "paymentMethodId": "",
  "enabled": false
};

/// config for after shipping
const afterShip = {
  "api": "e2e9bae8-ee39-46a9-a084-781d0139274f",
  "tracking_url": "https://fluxstore.aftership.com"
};

/// Limit the country list from Billing Address
/// []: default show all country
const List DefaultCountry = [];

//const List DefaultCountry = [
//  {
//    "name": "Vietnam",
//    "iosCode": "VN",
//    "icon": "https://cdn.britannica.com/41/4041-004-A06CBD63/Flag-Vietnam.jpg"
//  },
//  {
//    "name": "India",
//    "iosCode": "IN",
//    "icon":
//        "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
//  },
//  {"name": "Austria", "iosCode": "AT", "icon": ""},
//];
