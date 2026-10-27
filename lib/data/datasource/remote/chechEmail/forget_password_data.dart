import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData(this.crud);
  postData(String email) async {
    var respons = await crud.postData(AppLink.forgetPasswordData, {
      "email": email,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
