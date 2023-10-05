import 'package:flutter/material.dart';
import 'package:tutorial_app/constants/colors.dart';

import 'audio_item.dart';

class CategoryItem extends StatelessWidget {
  final String categoryTitle;
  final List<dynamic>? getDataListFromDB;

  const CategoryItem({
    required this.categoryTitle,
    required this.getDataListFromDB,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print('data list from main_audio_books_screen : : $getDataListFromDB');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryTitle,
          style: TextStyle(
            color: pinkColor,
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.025,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: size.height * 0.29,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getDataListFromDB!.length,
                    itemBuilder: (context, index) {
                      return AudioItem(
                        audioTitle: getDataListFromDB![index]['title'],
                        imageUrl: getDataListFromDB![index]['imageUrl'],
                        audioDuration: getDataListFromDB![index]
                            ['audioDuration'],
                        audioSource: getDataListFromDB![index]['audioSource'],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
