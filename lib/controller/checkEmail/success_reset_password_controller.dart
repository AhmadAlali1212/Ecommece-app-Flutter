import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:get/get.dart';

abstract class AbstractSuccessResetPasswordController extends GetxController {
  toLogin() {}
}

class SuccessResetPasswordController
    extends AbstractSuccessResetPasswordController {
  @override
  toLogin() {
    Get.offNamed(AppRoutes.login);
  }
}
