import 'package:ecommeceappcourse/controller/item_details_controller.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemColors extends GetView<ItemDetailsController> {
  const CustomItemColors({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Color",

                    style: TextStyle(
                      color: ColorConstant.colorSecondMain,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    ...List.generate(controller.subItems.length, ((index) {
                      return Container(
                        margin: EdgeInsets.all(3),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 8),
                        width: 80,
                        height: 60,
                        decoration: BoxDecoration(
                          color: controller.subItems[index]["active"] == true
                              ? ColorConstant.colorSecondMain
                              : null,
                          border: BoxBorder.all(
                            color: ColorConstant.colorSecondMain,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          controller.subItems[index]["name"],

                          style: TextStyle(
                            color: controller.subItems[index]["active"] == false
                                ? ColorConstant.colorSecondMain
                                : null,
                            fontSize: 22,
                            height: 0.6,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    })),
                  ],
                ),
              ],
            ),
          );
  }
}