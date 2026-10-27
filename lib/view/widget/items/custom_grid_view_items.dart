import 'package:ecommeceappcourse/controller/favorite_controller.dart';
import 'package:ecommeceappcourse/controller/items_comtroller.dart';
import 'package:ecommeceappcourse/core/class/handlind_data_view.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/constant/image_assest.dart';
import 'package:ecommeceappcourse/core/functions/translate_data_base.dart';
import 'package:ecommeceappcourse/data/model/items_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridViewItems extends GetView<ItemsComtroller> {
  const CustomGridViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.find<FavoriteController>();

    return HandlindDataView(
      statusRequset: controller.statusRequset,
      widget: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        itemCount: controller.data.length,
        itemBuilder: (context, index) {
          favoriteController.isFavorite[controller.data[index]['items_id']] =
              controller.data[index]['favorite'].toString();
          return CardItems(
            itemsModel: ItemsModel.fromJson(controller.data[index]),
          );
        },
      ),
    );
  }
}

class CardItems extends GetView<ItemsComtroller> {
  final ItemsModel itemsModel;

  const CardItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDetails(itemsModel);
      },

      child: Stack(
        children: [
          Card(
            color: ColorConstant.whitePrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: itemsModel.itemsId!,
                  child: CachedNetworkImage(
                    imageUrl: "${AppLink.itemsImage}/${itemsModel.itemsImage}",
                    height: 130,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    TranslateDataBase(
                      " ${itemsModel.itemsNameAr}",
                      " ${itemsModel.itemsName}",
                    ),
                    style: TextStyle(
                      color: ColorConstant.blackPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        TranslateDataBase(
                          " ${controller.deliveryTime} Minute",
                          " ${controller.deliveryTime} Minute",
                        ),
                        style: TextStyle(color: ColorConstant.blackPrimary),
                      ),
                    ),
                    Icon(Icons.alarm_outlined),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.bottomLeft,
                      child: Builder(
                        builder: (context) {
                          final total = itemsModel.totalRating ?? 0;
                          final count = itemsModel.ratingCount ?? 0;
                          final double avg = (count > 0)
                              ? (total / count)
                              : 0.0;
                          return Row(
                            children: [
                              Text(
                                avg.toStringAsFixed(1),
                                style: TextStyle(
                                  color: ColorConstant.blackPrimary,
                                ),
                              ),
                              SizedBox(width: 6),
                              ...List.generate(5, (i) {
                                return Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Icon(
                                    i < avg.round()
                                        ? Icons.star
                                        : Icons.star_border,
                                    size: 16,
                                    color: ColorConstant.puplerDistinct,
                                  ),
                                );
                              }),
                              SizedBox(width: 6),
                              Text('(${count.toString()})'),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        TranslateDataBase(
                          " ${itemsModel.itemspricediscount}\$",
                          " ${itemsModel.itemspricediscount}\$",
                        ),
                        style: TextStyle(color: ColorConstant.puplerDistinct),
                      ),
                    ),
                    SizedBox(),
                    Container(
                      padding: EdgeInsets.only(right: 16, top: 8),
                      child: GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsModel.itemsId] ==
                                "1") {
                              controller.setFavorite(itemsModel.itemsId, "0");
                              controller.favoriteRemove(
                                itemsModel.itemsId.toString(),
                              );
                            } else {
                              controller.setFavorite(itemsModel.itemsId, "1");
                              controller.favoriteAdd(
                                itemsModel.itemsId.toString(),
                              );
                            }
                          },
                          icon: controller.isFavorite[itemsModel.itemsId] == "1"
                              ? Icon(
                                  Icons.favorite,
                                  size: 25,
                                  color: ColorConstant.puplerDistinct,
                                )
                              : Icon(Icons.favorite_border_outlined, size: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          if (itemsModel.itemsDiscount.toString() != '0')
            Positioned(
              child: Image.asset(ImageAssest.sale, width: 50, height: 50),
            ),
        ],
      ),
    );
  }
}
