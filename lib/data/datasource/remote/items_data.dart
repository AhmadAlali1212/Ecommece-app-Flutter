import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String catId, String userId) async {
    var respons = await crud.postData(AppLink.items, {
      "id": catId.toString(),
      "usersid": userId,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
