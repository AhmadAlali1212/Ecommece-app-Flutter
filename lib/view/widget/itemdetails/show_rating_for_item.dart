import 'package:ecommeceappcourse/controller/item_details_controller.dart';
import 'package:ecommeceappcourse/core/constant/image_assest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

showRatingForItem(BuildContext context) {
  final dialog = RatingDialog(
    initialRating: 1.0,
    title: Text(
      'rating_dialog_title'.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    message: Text(
      'rating_dialog_description'.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
    image: Image.asset(ImageAssest.LogoImage),
    submitButtonText: 'submit'.tr,
    commentHint: 'comment_hint'.tr,
    onSubmitted: (response) {
      ItemDetailsController controller = Get.find();
      controller.submitRatingItems(
        response.rating.toString(),
        response.comment,
      );
    },
  );

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => dialog,
  );
}
