import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/constants/colors.dart';
import 'package:tutorial_app/constants/sized_box.dart';
import 'package:tutorial_app/widget/category_item.dart';

import '../widget/shimmer_effect_main_category.dart';

class MainAudioBookScreen extends StatefulWidget {
  const MainAudioBookScreen({super.key});

  @override
  State<MainAudioBookScreen> createState() => _MainAudioBookScreenState();
}

class _MainAudioBookScreenState extends State<MainAudioBookScreen> {
  List<dynamic>? listOfDataFromDB = [];
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    try {
      final databaseReference = FirebaseDatabase.instance.ref();
      databaseReference.child('audiobooks').once().then(
        (snapshot) {
          if (snapshot.snapshot.value != null) {
            List<dynamic> data = snapshot.snapshot.value as List<dynamic>;
            if (data.isNotEmpty) {
              setState(() {
                listOfDataFromDB = data;
              });
              print(
                  "The data fetched is :: ${listOfDataFromDB?[0]['motivation'][0]['title']}");
              // print('Data get is :: ${snapshot.snapshot.value}');
            } else {
              print('No Data Found');
            }
          }
        },
      );
    } catch (e) {
      print('error in main_audio_book_screen :: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Aaaaaaa',
                style: TextStyle(
                  color: pinkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.04,
                ),
              ),
              TextSpan(
                text: 'udio Books',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.035,
                ),
              ),
            ],
          ),
        ),
      ),
      body: (listOfDataFromDB == null || listOfDataFromDB!.isEmpty)
          ? ListView.separated(
              itemBuilder: (context, index) {
                return const ShimmerEffectMainCategoryScreen();
              },
              separatorBuilder: (context, index) {
                return sizedBox(10, 0.0);
              },
              itemCount: 3,
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Listen to Your Favourite Topics!',
                      style: TextStyle(
                        fontSize: size.height * 0.024,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CategoryItem(
                      categoryTitle: 'Motivation',
                      getDataListFromDB: listOfDataFromDB![0]['motivation'],
                    ),
                    sizedBox(20, 0.0),
                    CategoryItem(
                      categoryTitle: 'Fantasy Stories',
                      getDataListFromDB: listOfDataFromDB![1]['fantasy'],
                    ),
                    sizedBox(20, 0.0),
                    CategoryItem(
                      categoryTitle: 'Daily Podcasts',
                      getDataListFromDB: listOfDataFromDB![2]['daily_podcasts'],
                    ),
                    sizedBox(20, 0.0),
                    CategoryItem(
                      categoryTitle: 'Adventure Stories',
                      getDataListFromDB: listOfDataFromDB![3]
                          ['Adventure_stories'],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
