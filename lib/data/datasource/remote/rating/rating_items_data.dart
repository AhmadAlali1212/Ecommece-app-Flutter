import 'package:ecommeceappcourse/core/class/crud.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';

class RatingItemsData {
  Crud crud;
  RatingItemsData(this.crud);

  rateItem(String userid, String itemsid, String starnumber) async {
    var respons = await crud.postData(AppLink.ratingItems, {
      "userid": userid,
      "itemsid": itemsid,
      "starnumber": starnumber,
    });
    return respons.fold((l) => l, (r) => r);
  }
}
