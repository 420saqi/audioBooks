import 'package:flutter/material.dart';
import 'package:tutorial_app/widget/audio_item.dart';
import 'package:tutorial_app/widget/category_item.dart';

class MainAudioBookScreen extends StatelessWidget {
  const MainAudioBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'A',
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              TextSpan(
                text: 'udio Books',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Listen to Your Favourite Topics!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CategoryItem(),
              const SizedBox(height: 20),
              CategoryItem(),
              const SizedBox(height: 20),
              CategoryItem(),
            ],
          ),
        ),
      ),
    );
  }
}
