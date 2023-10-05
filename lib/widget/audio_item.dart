import 'package:flutter/material.dart';
import 'package:tutorial_app/constants/colors.dart';
import 'package:tutorial_app/constants/sized_box.dart';
import 'package:tutorial_app/screens/play_audio_item_screen.dart';

class AudioItem extends StatefulWidget {
  final String imageUrl;
  final String audioTitle;
  final String audioDuration;
  final String audioSource;

  const AudioItem({
    super.key,
    required this.audioTitle,
    required this.imageUrl,
    required this.audioDuration,
    required this.audioSource,
  });

  @override
  State<AudioItem> createState() => _AudioItemState();
}

class _AudioItemState extends State<AudioItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height * 0.01),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlayAudioItemScreen(
              imageUrl: widget.imageUrl,
              audioTitle: widget.audioTitle,
              audioSource: widget.audioSource,
            ),
          ));
        },
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.16,
              width: screenSize.width * 0.32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greyColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            sizedBox(7, 0.0),
            SizedBox(
              width: size.width * 0.25,
              height: size.height * 0.04,
              child: Center(
                child: Text(
                  widget.audioTitle,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.02,
                  ),
                ),
              ),
            ),
            sizedBox(15, 0.0),
            Text(
              widget.audioDuration,
              style: TextStyle(
                color: greyColor.shade800,
                fontSize: size.height * 0.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
