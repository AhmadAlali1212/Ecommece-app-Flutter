import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  cartadd(String usersId, String itemsId) async {
    var respons = await crud.postData(AppLink.cartAdd, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return respons.fold((l) => l, (r) => r);
  }

  cartremove(String usersId, String itemsId) async {
    var respons = await crud.postData(AppLink.cartRemove, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return respons.fold((l) => l, (r) => r);
  }

  cartcount(String usersId, String itemsId) async {
    var respons = await crud.postData(AppLink.cartCount, {
      "usersid": usersId,
      "itemsid": itemsId,
    });
    return respons.fold((l) => l, (r) => r);
  }

  cartview(String usersId) async {
    var respons = await crud.postData(AppLink.cartView, {"usersid": usersId});
    return respons.fold((l) => l, (r) => r);
  }

  checkCuopon(String couponName) async {
    var respons = await crud.postData(AppLink.couponCheck, {
      "couponname": couponName,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
