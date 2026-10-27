import 'package:ecommeceappcourse/core/constant/status_requset.dart';

handdlingData(response) {
  if (response is StatusRequset) {
    return response;
  } else {
    return StatusRequset.success;
  }
}
