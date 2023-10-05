import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

class AudioProvider with ChangeNotifier {
  bool _isPlaying = false;
  final _audioPlayer = AudioPlayer();
  Duration _audioTotalDuration = Duration.zero;
  Duration _audioCurrentPosition = Duration.zero;
  AudioPlayer get audioPlayer => _audioPlayer;
  bool get isPlaying => _isPlaying;
  Duration get getAudioTotalDuration => _audioTotalDuration;
  Duration get getAudioCurrentPosition => _audioCurrentPosition;
  void audioCurrentPosition(var position) {
    _audioCurrentPosition = position;
    notifyListeners();
  }

  void audioTotalDuration(var duration) {
    _audioTotalDuration = duration;
    notifyListeners();
  }

  void setIsPlaying(bool playing) {
    _isPlaying = playing;
    notifyListeners();
  }

  void playPause(String audioUrl) {
    if (_audioPlayer.state == PlayerState.playing) {
      _isPlaying = false;
      notifyListeners();
      _audioPlayer.pause();
      print('pause function executed');
      notifyListeners();
    } else {
      _isPlaying = true;
      print('The player state is :: ${_audioPlayer.state}');
      print('Now Playing the song');
      _audioPlayer.play(UrlSource(audioUrl));
      notifyListeners();
    }
  }

  void disposeAudio() {
    print('Now disposing the function in AudioProvider file');
    _audioPlayer.stop();
    _audioPlayer.dispose();
    notifyListeners();
  }
}
