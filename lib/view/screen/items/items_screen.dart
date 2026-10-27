import 'package:ecommeceappcourse/controller/items_comtroller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/view/screen/home.dart';
import 'package:ecommeceappcourse/view/widget/custom_app_bar.dart';
import 'package:ecommeceappcourse/view/widget/items/custom_grid_view_items.dart';
import 'package:ecommeceappcourse/view/widget/items/custom_list_view_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsComtroller());
    return Scaffold(
      backgroundColor: ColorConstant.whitePrimary,
      body: GetBuilder<ItemsComtroller>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: ListView(
            children: [
              CustomAppBar(
                myController: controller.search!,
                searchText: "Search About Proudct",
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
              SizedBox(height: 15),
              HandlindDataView(
                statusRequset: controller.statusRequset,
                widget: !controller.isSearch
                    ? Column(
                        children: [
                          CustomListViewCategoriesItems(),
                          CustomGridViewItems(),
                        ],
                      )
                    : ItemsSearch(listDataSearch: controller.listData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
