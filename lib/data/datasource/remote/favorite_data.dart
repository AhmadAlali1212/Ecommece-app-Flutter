import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  favoriteadd(String usersId, String itemsId) async {
    var respons = await crud.postData(AppLink.favoriteAdd, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return respons.fold((l) => l, (r) => r);
  }

  favoriteremove(String usersId, String itemsId) async {
    var respons = await crud.postData(AppLink.favoriteRemove, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
