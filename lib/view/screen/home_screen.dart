import 'dart:io';

import 'package:ecommeceappcourse/controller/home_screen_controller.dart';
import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/view/widget/home/materialbutton_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConstant.puplerDistinct,
          shape: CircleBorder(),
          onPressed: () {
            Get.toNamed(AppRoutes.cartScreen);
          },
          child: Icon(Icons.shopping_basket_outlined, size: 40),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          height: 79,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              ...List.generate(controller.homePageList.length + 1, ((index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? Spacer()
                    : MaterialButtonHome(
                        onPressed: () {
                          controller.changedPage(i);
                        },
                        icon: controller.homeScreenIcon[i],
                        text: controller.homeScreenTitle[i],
                        active: controller.currentPage == i ? true : false,
                      );
              })),
            ],
          ),

          // Row(
          //   children: [
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(0);
          //       },
          //       icon: Icons.home,
          //       text: "Home",
          //       active: controller.currentPage == 0 ? true : false,
          //     ),
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(1);
          //       },
          //       icon: Icons.settings,
          //       text: "Settings",
          //       active: controller.currentPage == 1 ? true : false,
          //     ),
          //   ],
          // ),
          // Spacer(),
          // Row(
          //   children: [
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(2);
          //       },
          //       icon: Icons.favorite,
          //       text: "Favorite",
          //       active: controller.currentPage == 2 ? true : false,
          //     ),
          //     MaterialButtonHome(
          //       onPressed: () {
          //         controller.changedPage(3);
          //       },
          //       icon: Icons.person,
          //       text: "Person",
          //       active: controller.currentPage == 3 ? true : false,
          //     ),
          //   ],
          // ),
          //    ],
        ),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, t) {
            if (didPop) return;
            Get.defaultDialog(
              title: "warning".tr,

              middleText: "exit_confirm_message".tr,
              onCancel: () {},
              cancelTextColor: ColorConstant.puplerDistinct,
              confirmTextColor: ColorConstant.puplerDistinct,
              buttonColor: ColorConstant.puplerLight,
              onConfirm: () {
                exit(0);
              },
            );
          },
          child: controller.homePageList.elementAt(controller.currentPage),
        ),
      ),
    );
  }
}
