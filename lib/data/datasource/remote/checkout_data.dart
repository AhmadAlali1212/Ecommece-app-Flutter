import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map map) async {
    var respons = await crud.postData(AppLink.checkout, map);
    return respons.fold((l) => l, (r) => r);
  }
}
