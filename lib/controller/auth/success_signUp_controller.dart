import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class AbstractSuccessSignupController extends GetxController {
  toLogin() {}
}

class SuccessSignupController extends AbstractSuccessSignupController {
  @override
  toLogin() {
    Get.offNamed(AppRoutes.login);
    return super.toLogin();
  }
}
