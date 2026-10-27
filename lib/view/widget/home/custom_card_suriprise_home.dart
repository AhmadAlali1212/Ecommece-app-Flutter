import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomCardSuripriseHome extends GetView<HomeController> {
  final String title;
  final String subtitle;
  const CustomCardSuripriseHome({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(125, 102, 255, 1),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
        ),
        Positioned(
          top: -20,
          right: controller.lang == "en" ? -20 : null,
          left: controller.lang == "ar" ? -20 : null,

          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(160),
              color: ColorConstant.secondPuplerDistinct,
            ),
          ),
        ),
      ],
    );
  }
}
