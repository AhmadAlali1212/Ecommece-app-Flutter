import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommeceappcourse/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomStackImage extends StatelessWidget {
  const CustomStackImage({super.key,required this.imageId,required this.imageUrl});
  final int imageId;
    final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 225,
          decoration: BoxDecoration(color: ColorConstant.puplerDistinct),
        ),
        Positioned(
          child: Hero(
            tag: imageId,
            child: Container(
              padding: EdgeInsets.only(left: 80, top: 65),
              child: CachedNetworkImage(
                alignment: Alignment.center,
                width: 260,
                height: 260,
                fit: BoxFit.fill,
                imageUrl:
                   imageUrl,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
