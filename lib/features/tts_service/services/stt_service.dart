import 'package:speech_to_text/speech_to_text.dart';

abstract class STTService {
  Future<void> init();
  Future<void> startListening(Function(String text) onResult);
  Future<void> stopListening();
  bool get isListening;
}

class SpeechToTextService implements STTService {
  final _speechToText = SpeechToText();
  bool _isInitialized = false;

  @override
  bool get isListening => _speechToText.isListening;

  @override
  Future<void> init() async {
    if (!_isInitialized) {
      _isInitialized = await _speechToText.initialize(
        onError: (error) => print('Error: $error'),
        onStatus: (status) => print('Status: $status'),
      );
    }
  }

  @override
  Future<void> startListening(Function(String text) onResult) async {
    if (!_isInitialized) await init();
    
    await _speechToText.listen(
      onResult: (result) {
        if (result.finalResult) {
          onResult(result.recognizedWords);
        }
      },
      localeId: 'ko_KR',
    );
  }

  @override
  Future<void> stopListening() async {
    await _speechToText.stop();
  }
} 