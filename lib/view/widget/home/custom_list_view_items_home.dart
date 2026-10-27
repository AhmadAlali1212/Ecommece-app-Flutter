import 'package:ecommeceappcourse/controller/home_controller.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';
import 'package:ecommeceappcourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListViewItemsHome extends GetView<HomeController> {
  const CustomListViewItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return ItemsHome(
            itemsModel: ItemsModel.fromJson(controller.items[i]),
          );
        },
        itemCount: controller.items.length,
      ),
    );
  }
}

class ItemsHome extends GetView<HomeController> {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            height: 150,
            width: 160,
            child: Image.network(
              "${AppLink.itemsImage}/${itemsModel.itemsImage}",
            ),
          ),
          Container(
            height: 150,
            width: 185,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(
                255,
                50,
                18,
                231,
              ).withValues(alpha: 0.25),
            ),
          ),

          // Positioned(
          //   left: 5,
          //   child: Text(
          //     "DisCount ${itemsModel.itemsDiscount}%",
          //     style: TextStyle(
          //       color: ColorConstant.whitePrimary,
          //       fontSize: 25,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
