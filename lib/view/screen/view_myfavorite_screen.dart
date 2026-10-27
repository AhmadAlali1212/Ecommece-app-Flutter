import 'package:ecommeceappcourse/controller/view_myfavorite_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/view/screen/home.dart';
import 'package:ecommeceappcourse/view/widget/custom_app_bar.dart';
import 'package:ecommeceappcourse/view/widget/custom_grid_view_myfavorite_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewMyfavoriteScreen extends StatelessWidget {
  const ViewMyfavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ViewMyfavoriteController controller = Get.put(ViewMyfavoriteController());
    return Scaffold(
      backgroundColor: ColorConstant.whitePrimary,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),

        child: ListView(
          children: [
            CustomAppBar(
              myController: controller.search!,
              searchText: "search_about_product".tr,
              onPressedNotifications: () {},
              onPressedFavorite: () {
                Get.toNamed(AppRoutes.viewMyfavorite);
              },
              onPressedSearch: () {
                controller.onSearch();
              },
              onChangedSearch: (val) {
                controller.ckechSearch(val);
              },
            ),
            SizedBox(height: 10),
            GetBuilder<ViewMyfavoriteController>(
              builder: (controller) => HandlindDataView(
                statusRequset: controller.statusRequset,
                widget: !controller.isSearch
                    ? CustomGridViewMyfavoriteItems()
                    : ItemsSearch(listDataSearch: controller.listData),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
