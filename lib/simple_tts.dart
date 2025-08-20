import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rwkim_tts/config/tts_api.dart';
import 'features/tts_service/services/tts_service.dart';

final simpleTTSProvider = Provider<SimpleTTS>((ref) {
  return SimpleTTS(
    baseUrl: supertoneApiUrl,
    path: '/api/v1/tts',
    ref: ref,
  );
});

class SimpleTTS {
  final Ref ref;
  final TTSServiceImpl _ttsService;
  bool _initialized = false;

  SimpleTTS(
      {required String baseUrl, String path = '/api/v1/tts', required this.ref})
      : _ttsService = ref.watch(ttsServiceProvider);

  Future<void> speakText({
    required String text,
    required String voiceId,
    String language = 'ko',
  }) async {
    try {
      if (!_initialized) {
        await _ttsService.init();
        _initialized = true;
      }
      await _ttsService.speak({
        'text': text,
        'language': language,
        'voiceId': voiceId,
      });
    } catch (e) {
      print('Error in SimpleTTS speakText: $e');
      return;
    }
  }

  Future<void> stop() async => _ttsService.stop();
  Future<void> dispose() async => _ttsService.dispose();
}
