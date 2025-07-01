import 'features/tts_service/repositories/supertone_repository.dart';
import 'features/tts_service/services/tts_service.dart';

class SimpleTTS {
  final TTSServiceImpl _ttsService;
  bool _initialized = false;

  SimpleTTS({required String baseUrl, String path = '/api/v1/tts'})
      : _ttsService = TTSServiceImpl(
          TTSRepository(baseUrl: baseUrl, path: path),
        );

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
