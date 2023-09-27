import 'package:flutter/material.dart';
import 'package:tutorial_app/screens/play_audio_item_screen.dart';

class AudioItem extends StatelessWidget {
  // final String imageUrl;
  // final String title;
  const AudioItem({
    super.key,
    // required this.title,
    // required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PlayAudioItemScreen(),
          ));
        },
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.16,
              width: screenSize.width * 0.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'Title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              'Duration',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
