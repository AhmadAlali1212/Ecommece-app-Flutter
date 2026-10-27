import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomCardItemsCart extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CustomCardItemsCart({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.image,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        spacing: 4,
        children: [
          Card(
            color: ColorConstant.whitePrimary,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.fill,
                    height: 130,
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: ListTile(
                    title: Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Text(
                        name,
                        style: TextStyle(
                          color: ColorConstant.blackPrimary,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        price,
                        style: TextStyle(
                          color: ColorConstant.puplerDistinct,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
                      Text(
                        count,
                        style: TextStyle(color: ColorConstant.blackPrimary),
                      ),
                      SizedBox(height: 4),
                      IconButton(onPressed: onRemove, icon: Icon(Icons.remove)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
