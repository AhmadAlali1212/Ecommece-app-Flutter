import 'package:ecommeceappcourse/controller/orders/orders_archive_controller.dart';
import 'package:ecommeceappcourse/core/constant/image_assest.dart';
import 'package:ecommeceappcourse/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/utils.dart';
import 'package:rating_dialog/rating_dialog.dart';

showRaingForOrder(BuildContext context, OrdersModel ordersModel) {
  final dialog = RatingDialog(
    initialRating: 1.0,
    // your app's name?
    title: Text(
      'rating_dialog_title'.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    // encourage your user to leave a high rating?
    message: Text(
      'rating_dialog_description'.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
    // your app's logo?
    image: Image.asset(ImageAssest.LogoImage),
    submitButtonText: 'submit'.tr,
    commentHint: 'comment_hint'.tr,
    //  onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      //    print('rating: ${response.rating}, comment: ${response.comment}');
      OrdersArchiveController controller = Get.put(OrdersArchiveController());
      controller.submitRatingOrders(
        ordersModel.ordersId.toString(),
        response.rating.toString(),
        response.comment,
      );
    },
  );

  // show the dialog
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => dialog,
  );
}
