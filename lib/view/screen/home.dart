import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';
import 'package:ecommeceappcourse/core/constant/app_routes.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/functions/translate_data_base.dart';
import 'package:ecommeceappcourse/data/model/items_model.dart';
import 'package:ecommeceappcourse/view/widget/home/custom_list_view_categories_home.dart';
import 'package:ecommeceappcourse/view/widget/custom_app_bar.dart';
import 'package:ecommeceappcourse/view/widget/home/custom_card_suriprise_home.dart';
import 'package:ecommeceappcourse/view/widget/home/custom_list_view_items_home.dart';
import 'package:ecommeceappcourse/view/widget/home/custom_titles_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(horizontal: 13),
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

              HandlindDataView(
                statusRequset: controller.statusRequset,
                widget: !controller.isSearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCardSuripriseHome(
                            title: controller.titleHomeCard,
                            subtitle: controller.bodyHomeCard,
                          ),
                          SizedBox(height: 15),

                          CustomTitlesHome(title: "categories".tr),
                          CustomListViewCategoriesHome(),
                          SizedBox(height: 15),
                          CustomTitlesHome(title: "selling_top".tr),
                          CustomListViewItemsHome(),
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

class ItemsSearch extends GetView<HomeController> {
  const ItemsSearch({super.key, required this.listDataSearch});
  final List<ItemsModel> listDataSearch;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listDataSearch.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToItemDetails(listDataSearch[index]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Card(
              color: ColorConstant.whitePrimary,

              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLink.itemsImage}/${listDataSearch[index].itemsImage}",
                      height: 130,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          TranslateDataBase(
                            " ${listDataSearch[index].itemsNameAr}",
                            " ${listDataSearch[index].itemsName}",
                          ),
                        ),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          TranslateDataBase(
                            " ${listDataSearch[index].itemsPrice}\$",
                            " ${listDataSearch[index].itemsPrice}\$",
                          ),
                          style: TextStyle(
                            color: ColorConstant.puplerDistinct,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
