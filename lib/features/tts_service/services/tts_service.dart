import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:rwkim_tts/features/tts_service/providers/audio_player_provider.dart';
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

final ttsServiceProvider = Provider<TTSServiceImpl>((ref) {
  final repository = ref.watch(ttsRepositoryProvider);
  final player = ref.watch(audioPlayerProvider);
  return TTSServiceImpl(repository, player);
});

class TTSServiceImpl implements TTSService {
  final TTSRepository repository;
  final AudioPlayer player;

  // AudioPlayer? player; // late -> nullable로 변경

  TTSServiceImpl(this.repository, this.player);

  // Future<void> _ensureInitialized() async {
  //   if (!_isInitialized) {
  //     player = AudioPlayer();
  //   }
  // }
  @override
  Future<void> speak(Map<String, dynamic> data) async {
    try {
      // await _ensureInitialized(); // 자동 초기화
      final audioBytes = await repository.fetchTtsAudio(data);
      await player.play(BytesSource(audioBytes));
    } catch (e) {
      print('TTSServiceImpl speak error: $e');
      return;
    }
  }

  @override
  Future<void> stop() async {
    await player.stop();
  }

  @override
  Future<void> dispose() async {
    await player.dispose();
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}
