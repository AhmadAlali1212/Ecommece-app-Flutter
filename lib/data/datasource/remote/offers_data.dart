import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);
  getData() async {
    var respons = await crud.postData(AppLink.offers, {});
    return respons.fold((l) => l, (r) => r);
  }
}
