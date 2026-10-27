class AppLink {
  static const String server = "http://10.0.2.2/ecommeceapp";
  static const String test = "$server/test.php";
  //                      Auth
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verificationCode = "$server/auth/verify_code.php";
  static const String resend = "$server/auth/resend.php";

  //                      Forget Password

  static const String forgetPasswordData =
      "$server/forgetpassword/check_email.php";
  static const String verifyCodeEmail =
      "$server/forgetpassword/verify_code_email.php";
  static const String resetPassword =
      "$server/forgetpassword/reset_password.php";

  //                        Home
  static const String home = "$server/home.php";
  //                Items
  static const String items = "$server/item/items.php";
  static const String search = "$server/item/search.php";

  //             image
  static const String categoriesImage = "$server/upload/categories";
  static const String itemsImage = "$server/upload/items";

  //              Favorite
  static const String favoriteAdd = "$server/favorite/favorite_add.php";
  static const String favoriteRemove = "$server/favorite/favorite_remove.php";
  static const String viewMyfavorite = "$server/favorite/view_myfavorite.php";
  static const String deleltfromfavorite =
      "$server/favorite/delelt_from_favorite.php";

  //    Cart
  static const String cartAdd = "$server/cart/add.php";
  static const String cartRemove = "$server/cart/remove.php";
  static const String cartCount = "$server/cart/cart_count.php";
  static const String cartView = "$server/cart/view.php";

  //    Address
  static const String addressAdd = "$server/address/add.php";
  static const String addressRemove = "$server/address/remove.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressView = "$server/address/view.php";

  static const String couponCheck = "$server/coupon/check_coupon.php";
  //     Orders
  static const String checkout = "$server/orders/checkout.php";
  static const String ordersPending = "$server/orders/pending.php";
  static const String archive = "$server/orders/archive.php";
  static const String details = "$server/orders/details.php";
  static const String delete = "$server/orders/delete.php";

  // Notifications
  static const String notifications = "$server/notifications.php";
  //  offers
  static const String offers = "$server/offers.php";

  // Rating
  static const String ratingOrder = "$server/rating/rating_order.php";
  static const String ratingItems = "$server/rating/rating_items.php";
}
