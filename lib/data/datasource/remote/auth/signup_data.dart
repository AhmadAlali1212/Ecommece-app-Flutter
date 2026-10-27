import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String username, String email, String phone, String password) async {
    var respons = await crud.postData(AppLink.signUp, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
