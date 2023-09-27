import 'package:flutter/material.dart';

class AudioSlider extends StatelessWidget {
  const AudioSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slider(
          value: 0,
          onChanged: (value) {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.forward_5_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.forward_5_outlined),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Story Text',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Card(
          child: Text(
            'Story text',
          ),
        ),
      ],
    );
  }
}
