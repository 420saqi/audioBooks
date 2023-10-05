import 'package:flutter/material.dart';
import 'package:tutorial_app/constants/colors.dart';

class AudioItemImage extends StatelessWidget {
  final String imageUrl;
  const AudioItemImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.height * 0.04,
      ),
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
