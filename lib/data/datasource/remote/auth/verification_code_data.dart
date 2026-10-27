import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class VerificationCodeData {
  Crud crud;
  VerificationCodeData(this.crud);
  postData(String email, String verifycode) async {
    var respons = await crud.postData(AppLink.verificationCode, {
      "email": email,
      "verifycode": verifycode,
    });
    return respons.fold((l) => l, (r) => r);
  }

  reSend(String email) async {
    var respons = await crud.postData(AppLink.resend, {"email": email});
    return respons.fold((l) => l, (r) => r);
  }
}
