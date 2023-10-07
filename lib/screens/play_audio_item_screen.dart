import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_app/constants/colors.dart';
import 'package:tutorial_app/constants/sized_box.dart';
import 'package:tutorial_app/widget/shimmer_playing_audio_item.dart';

import 'package:tutorial_app/widget/show_image_audio_item.dart';

class PlayAudioItemScreen extends StatefulWidget {
  final String imageUrl;
  final String audioTitle;
  final String audioSource;
  const PlayAudioItemScreen({
    super.key,
    required this.audioTitle,
    required this.imageUrl,
    required this.audioSource,
  });

  @override
  State<PlayAudioItemScreen> createState() => _PlayAudioItemScreenState();
}

class _PlayAudioItemScreenState extends State<PlayAudioItemScreen> {
  Duration durationPlusOne = Duration.zero;
  bool isShimmer = true;
  bool _isPlaying = false;
  final _audioPlayer = AudioPlayer();
  Duration audioTotalDuration = Duration.zero;
  Duration audioCurrentPosition = Duration.zero;

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        setState(() {
          isShimmer = false;
        });
      },
    );
    _audioPlayer.setSourceUrl(widget.audioSource);

    _audioPlayer.onPositionChanged.listen((Duration p) {
      if (mounted) {
        setState(() {
          audioCurrentPosition = p;
        });
      }
    });
    _audioPlayer.onDurationChanged.listen((Duration d) {
      if (mounted) {
        setState(() {
          audioTotalDuration = d;
          print(
              'The total duration of the audio is ::: ${audioTotalDuration.inSeconds}');

          durationPlusOne = audioTotalDuration + const Duration(seconds: 1);
          print('Max Duration Value is :: ${durationPlusOne.inSeconds}');
          // durationPlusOne = (d + const Duration(seconds: 1));
        });
      }
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          _isPlaying = false;
          audioCurrentPosition = const Duration(seconds: 0);
        });
      }
    });

    super.initState();
  }

  void changedToDuration(int seconds) {
    final newDuration = Duration(seconds: seconds);
    _audioPlayer.seek(newDuration);
  }

  void playPause() {
    try {
      if (_isPlaying) {
        _audioPlayer.pause();
        _isPlaying = false;
        setState(() {});
        print('the value of is playing when pause : $_isPlaying');
        print('pause function executed');
      } else {
        _isPlaying = true;

        print('the value of is playing when play : $_isPlaying');
        print('The player state is :: ${_audioPlayer.state}');
        print('Now Playing the song');
        _audioPlayer.play(UrlSource(widget.audioSource));
        setState(() {});
      }
    } catch (e) {
      print('Error occured in play_audio_item_screen :: : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: isShimmer
            ? const ShimmerPlayingAudioItemScreen()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBox(10, 0.0),
                  IconButton(
                    onPressed: () {
                      _audioPlayer.dispose();
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: pinkColor,
                      size: size.height * 0.04,
                    ),
                  ),
                  sizedBox(10, 0.0),
                  AudioItemImage(imageUrl: widget.imageUrl),
                  sizedBox(40, 0.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(audioCurrentPosition.toString().split(".")[0]),
                        Text(durationPlusOne.toString().split(".")[0]),
                      ],
                    ),
                  ),
                  Slider(
                    min: 0.0,
                    max: audioTotalDuration.inSeconds.toDouble(),
                    value: audioCurrentPosition.inSeconds.toDouble().clamp(
                          0,
                          audioTotalDuration.inSeconds.toDouble(),
                        ),
                    onChanged: (value) {
                      if (mounted) {
                        setState(() {
                          changedToDuration(value.toInt());
                          audioCurrentPosition =
                              Duration(seconds: value.toInt());
                          // above line update the position of slider
                          // once the audio is completed and then if i seek
                          // the slider forward without playing it
                        });
                      }
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.42),
                    child: IconButton(
                      onPressed: playPause,
                      icon: Icon(
                        _isPlaying ? Icons.pause : Icons.play_circle,
                      ),
                      iconSize: size.height * 0.05,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
