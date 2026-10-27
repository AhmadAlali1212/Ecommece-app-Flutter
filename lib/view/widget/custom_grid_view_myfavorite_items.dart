import 'package:ecommeceappcourse/controller/view_myfavorite_controller.dart';
import 'package:ecommeceappcourse/core/constant/app_link.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:ecommeceappcourse/core/functions/translate_data_base.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommeceappcourse/data/model/view_myfavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomGridViewMyfavoriteItems extends StatelessWidget {
  const CustomGridViewMyfavoriteItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ViewMyfavoriteController>();
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemCount: controller.data.length,
      itemBuilder: (context, index) {
        return CardItems(itemsModel: controller.data[index]);
      },
    );
  }
}

class CardItems extends GetView<ViewMyfavoriteController> {
  final ViewMyfavoriteModel itemsModel;

  const CardItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //     controller.goToItemDetails(itemsModel);
      },

      child: Card(
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
                    "rating 4.5",
                    style: TextStyle(color: ColorConstant.blackPrimary),
                  ),
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
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "price ${itemsModel.itemsPrice}\$",
                    style: TextStyle(color: ColorConstant.puplerDistinct),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 12, top: 11),
                  child: IconButton(
                    onPressed: () {
                      controller.deleltMyfavorite(
                        itemsModel.favoriteId.toString(),
                      );
                    },
                    icon: Icon(Icons.delete_outline_outlined),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
