class AppConstants {
  static const String APP_NAME = "DBFood";
  static const int APP_VERSION = 1;

  static const String BASE_URL_ORIG = "http://mvs.bslmeiyu.com";
  // static const String BASE_URL = "http://mvs.bslmeiyu.com";
  static const String BASE_URL = "http://127.0.0.1:5000";
  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular";
  static const String RECOMMEND_PRODUCT_URI = "/api/v1/products/recommended";
  static const String DRINK_PRODUCT_URI = "/api/v1/products/drink";

  static const String UPLOAD_URL = BASE_URL_ORIG + "/uploads/";

  // auth end point
  static const String REGISTRATION_URI = "/api/v1/auth/register";

  // login end point
  static const String LOGIN_URI = "/api/v1/auth/login";

// user info end point
  static const String USER_INFO_URI = "/api/v1/customer/info";

  static const String TOKEN = "DBtoken";
  static const String PASSWORD = "password";
  static const String PHONE = "phone";
  static const String CART_LIST = "Cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";
}
