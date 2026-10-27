import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/middleware/my_middle_ware.dart';
import 'package:ecommeceappcourse/view/address/Address_Detiails.dart';
import 'package:ecommeceappcourse/view/address/address_add.dart';
import 'package:ecommeceappcourse/view/address/address_view.dart';
import 'package:ecommeceappcourse/view/screen/cart_screen.dart';
import 'package:ecommeceappcourse/view/screen/checkEmail/forget_password.dart';
import 'package:ecommeceappcourse/view/screen/auth/login.dart';
import 'package:ecommeceappcourse/view/screen/checkEmail/reset_password.dart';
import 'package:ecommeceappcourse/view/screen/auth/signUp.dart';
import 'package:ecommeceappcourse/view/screen/checkEmail/success_reset_password.dart';
import 'package:ecommeceappcourse/view/screen/auth/success_signUp.dart';
import 'package:ecommeceappcourse/view/screen/auth/verificationCode.dart';
import 'package:ecommeceappcourse/view/screen/checkEmail/verification_email.dart';
import 'package:ecommeceappcourse/view/screen/checkout.dart';
import 'package:ecommeceappcourse/view/screen/choose_language.dart';
import 'package:ecommeceappcourse/view/screen/home_screen.dart';
import 'package:ecommeceappcourse/view/screen/items/item_details.dart';
import 'package:ecommeceappcourse/view/screen/items/items_screen.dart';
import 'package:ecommeceappcourse/view/screen/on_boarding.dart';
import 'package:ecommeceappcourse/view/screen/orders/archive.dart';
import 'package:ecommeceappcourse/view/screen/orders/order_details.dart';
import 'package:ecommeceappcourse/view/screen/orders/order_tarcking.dart';
import 'package:ecommeceappcourse/view/screen/orders/pending.dart';
import 'package:ecommeceappcourse/view/screen/view_myfavorite_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? route = [
  GetPage(
    name: "/",
    page: () => ChooseLanguage(),
    middlewares: [MyMiddleWare()],
  ),
  // GetPage(name: "/", page: () => TestView()),
  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.onboarding, page: () => OnBoarding()),
  GetPage(name: AppRoutes.signUp, page: () => SignUp()),
  GetPage(name: AppRoutes.home, page: () => HomeScreen()),

  GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.verificationCode, page: () => Verificationcode()),
  GetPage(name: AppRoutes.resetPassword, page: () => ResetPassword()),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => SuccessResetPassword(),
  ),
  GetPage(name: AppRoutes.successSignUp, page: () => SuccessSignUp()),
  GetPage(name: AppRoutes.verificationEmail, page: () => VerificationEmail()),
  GetPage(name: AppRoutes.itemsScreen, page: () => ItemsScreen()),
  GetPage(name: AppRoutes.itemDetails, page: () => ItemDetails()),
  GetPage(name: AppRoutes.viewMyfavorite, page: () => ViewMyfavoriteScreen()),
  GetPage(name: AppRoutes.cartScreen, page: () => CartScreen()),
  GetPage(name: AppRoutes.adressView, page: () => AddressView()),
  GetPage(name: AppRoutes.adressAdd, page: () => AddressAdd()),
  GetPage(name: AppRoutes.adressDetails, page: () => AddressDetiails()),
  GetPage(name: AppRoutes.checkout, page: () => Checkout()),
  GetPage(name: AppRoutes.ordersPending, page: () => OrdersPending()),
  GetPage(name: AppRoutes.archive, page: () => OrdersArchive()),
  GetPage(name: AppRoutes.orderDetails, page: () => OrderDetails()),
  GetPage(name: AppRoutes.tracking, page: () => OrderTracking()),
];
