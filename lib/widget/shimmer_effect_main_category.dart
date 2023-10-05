import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tutorial_app/constants/colors.dart';
import 'package:tutorial_app/constants/sized_box.dart';

class ShimmerEffectMainCategoryScreen extends StatelessWidget {
  const ShimmerEffectMainCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: greyColor300,
      highlightColor: greyColor100,
      child: Padding(
        padding: EdgeInsets.all(
          size.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(10, 0.0),
            Container(
              width: size.width * 0.3,
              height: size.height * 0.04,
              color: whiteColor,
            ),
            sizedBox(10, 0.0),
            Container(
              width: double.infinity,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
