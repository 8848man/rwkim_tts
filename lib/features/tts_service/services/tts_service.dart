import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:rwkim_tts/features/tts_service/repositories/supertone_repository.dart';

abstract class TTSService {
  Future<void> init();
  Future<void> speak(Map<String, dynamic> data);
  Future<void> stop();
  Future<void> dispose();
}

class FlutterTTSService implements TTSService {
  final _tts = FlutterTts();

  @override
  Future<void> init() async {
    await _tts.setLanguage('ko-KR');
    await _tts.setSpeechRate(0.5);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
  }

  @override
  Future<void> speak(Map<String, dynamic> data) async {
    String text = data['text'] ?? '';
    await _tts.speak(text);
  }

  @override
  Future<void> stop() async {
    await _tts.stop();
  }

  @override
  Future<void> dispose() async {
    await _tts.stop();
  }
}

class TTSServiceImpl implements TTSService {
  final TTSRepository repository;

  late final AudioPlayer _player;

  TTSServiceImpl(this.repository);

  @override
  Future<void> init() async {
    _player = AudioPlayer();
  }

  @override
  Future<void> speak(Map<String, dynamic> data) async {
    if (kIsWeb) {
      print('이건 웹에서 실행되고 있어요!');
    }
    final audioBytes = await repository.fetchTtsAudio(data);
    await _player.play(BytesSource(audioBytes));
  }

  @override
  Future<void> stop() async {
    await _player.stop();
  }

  @override
  Future<void> dispose() async {
    await _player.dispose();
  }
}
