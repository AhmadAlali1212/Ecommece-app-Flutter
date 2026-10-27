import 'package:ecommeceappcourse/controller/offers_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/data/model/items_model.dart';
import 'package:ecommeceappcourse/view/screen/home.dart';
import 'package:ecommeceappcourse/view/widget/custom_app_bar.dart';
import 'package:ecommeceappcourse/view/widget/offers/custom_list_view_items_offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: ListView(
          children: [
            CustomAppBar(
              myController: controller.search!,
              searchText: "app_settings".tr,
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
            SizedBox(height: 20),
            GetBuilder<OffersController>(
              builder: (controller) => HandlindDataView(
                statusRequset: controller.statusRequset,
                widget: !controller.isSearch
                    ? ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.listdata2.length,
                        itemBuilder: (context, index) {
                          return CustomListViewItemsOffers(
                            itemsModel: ItemsModel.fromJson(
                              controller.listdata2[index],
                            ),
                          );
                        },
                      )
                    : ItemsSearch(listDataSearch: controller.listData),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
