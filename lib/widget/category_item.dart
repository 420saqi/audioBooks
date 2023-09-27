import 'package:flutter/material.dart';

import 'audio_item.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category Title',
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const AudioItem();
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
