import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

exitAlret() {
  Future.delayed(Duration.zero, () {
    Get.defaultDialog(
      title: "notification".tr,
      middleText: "exit_confirm_message".tr,
      actions: [
        ElevatedButton(
          onPressed: () {
            exit(0);
          },
          child: Text("yes".tr),
        ),

        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("cancel".tr),
        ),
      ],
    );
  });
}
