import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class ViewMyfavoriteData {
  Crud crud;
  ViewMyfavoriteData(this.crud);
  getData(String usersId) async {
    var respons = await crud.postData(AppLink.viewMyfavorite, {
      "usersid": usersId,
    });
    return respons.fold((l) => l, (r) => r);
  }

  deletData(String favId) async {
    var respons = await crud.postData(AppLink.deleltfromfavorite, {
      "id": favId,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
