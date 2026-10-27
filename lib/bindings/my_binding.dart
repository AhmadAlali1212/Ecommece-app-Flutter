import 'package:ecommeceappcourse/controller/address/add_address_controller.dart';
import 'package:ecommeceappcourse/controller/address/address_details_controller.dart';
import 'package:ecommeceappcourse/controller/address/address_view_controller.dart';
import 'package:ecommeceappcourse/controller/auth/verificationCode_controller.dart';
import 'package:ecommeceappcourse/controller/cart_controller.dart';
import 'package:ecommeceappcourse/controller/checkEmail/forget_password_controller.dart';
import 'package:ecommeceappcourse/controller/auth/login_controller.dart';
import 'package:ecommeceappcourse/controller/checkEmail/reset_password_controller.dart';
import 'package:ecommeceappcourse/controller/auth/signup_controller.dart';
import 'package:ecommeceappcourse/controller/checkEmail/verificationCode_email_controller.dart';
import 'package:ecommeceappcourse/controller/notificatons_controller.dart';
import 'package:ecommeceappcourse/controller/orders/checkout_controller.dart';
import 'package:ecommeceappcourse/controller/favorite_controller.dart';
import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/controller/home_screen_controller.dart';
import 'package:ecommeceappcourse/controller/item_details_controller.dart';
import 'package:ecommeceappcourse/controller/items_comtroller.dart';
import 'package:ecommeceappcourse/controller/orders/order_details_controller.dart';
import 'package:ecommeceappcourse/controller/orders/orders_pending_controller.dart';
import 'package:ecommeceappcourse/controller/setting_controller.dart';
import 'package:ecommeceappcourse/controller/test_controller.dart';
import 'package:ecommeceappcourse/controller/view_myfavorite_controller.dart';
import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/view/screen/offers.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => VerificationCodeController(), fenix: true);
    Get.lazyPut(() => VerificationcodeEmailController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => ItemsComtroller(), fenix: true);
    Get.lazyPut(() => ItemDetailsController(), fenix: true);
    Get.lazyPut(() => FavoriteController(), fenix: true);
    Get.lazyPut(() => ViewMyfavoriteController(), fenix: true);
    Get.lazyPut(() => SettingCnontroller(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => AddAddressController(), fenix: true);
    Get.lazyPut(() => AddressDetailsController(), fenix: true);
    Get.lazyPut(() => AddressViewController(), fenix: true);
    Get.lazyPut(() => CheckoutController(), fenix: true);
    Get.lazyPut(() => OrdersPendingController(), fenix: true);
    Get.lazyPut(() => NotificatonsController(), fenix: true);
    Get.lazyPut(() => OrderDetailsController(), fenix: true);
    Get.lazyPut(() => Offers(), fenix: true);

    Get.put(() => TestController());
    Get.lazyPut(() => Crud(), fenix: true);
  }
}
