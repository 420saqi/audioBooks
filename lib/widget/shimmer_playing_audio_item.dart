import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/constants/colors.dart';
import 'package:tutorial_app/constants/sized_box.dart';

class ShimmerPlayingAudioItemScreen extends StatelessWidget {
  const ShimmerPlayingAudioItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.height * 0.09,
      ),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: greyColor300,
            highlightColor: greyColor100,
            child: Container(
              height: size.height * 0.3,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          sizedBox(15, 0.0),
          Shimmer.fromColors(
            baseColor: greyColor300,
            highlightColor: greyColor100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.25,
                    color: whiteColor,
                  ),
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.25,
                    color: whiteColor,
                  ),
                ],
              ),
            ),
          ),
          sizedBox(30, 0.0),
          Shimmer.fromColors(
            baseColor: greyColor300,
            highlightColor: greyColor100,
            child: Container(
              height: size.height * 0.02,
              width: double.infinity,
              color: whiteColor,
            ),
          ),
          sizedBox(30, 0.0),
          Shimmer.fromColors(
              baseColor: greyColor300,
              highlightColor: greyColor100,
              child: Container(
                height: size.height * 0.05,
                width: size.height * 0.05,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  shape: BoxShape.circle,
                ),
              ))
        ],
      ),
    );
  }
}
