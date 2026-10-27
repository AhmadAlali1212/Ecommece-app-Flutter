import 'package:ecommeceappcourse/controller/favorite_controller.dart';
import 'package:ecommeceappcourse/controller/offers_controller.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/constant/image_assest.dart';
import 'package:ecommeceappcourse/core/functions/translate_data_base.dart';
import 'package:ecommeceappcourse/data/model/items_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListViewItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;

  const CustomListViewItemsOffers({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemDetails(itemsModel);
      },

      child: Stack(
        children: [
          Card(
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
                      child: Text("rating 4.5"),
                    ),
                    ...List.generate(5, ((index) {
                      return Container(
                        padding: EdgeInsets.only(top: 8),

                        child: Icon(Icons.star, size: 16),
                      );
                    })),
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
