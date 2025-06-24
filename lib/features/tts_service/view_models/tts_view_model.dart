import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rwkim_tts/config/tts_api.dart';
import 'package:rwkim_tts/features/tts_service/models/tts_state.dart';
import 'package:rwkim_tts/features/tts_service/repositories/supertone_repository.dart';
import 'package:rwkim_tts/features/tts_service/services/stt_service.dart';
import 'package:rwkim_tts/features/tts_service/services/tts_service.dart';
import 'package:rwkim_tts/models/supertone_api_model.dart';

part 'tts_view_model.g.dart';

@riverpod
class TTSViewModel extends _$TTSViewModel {
  late final TTSService _ttsService;
  late final STTService _sttService;

  @override
  TTSState build() {
    // _ttsService = FlutterTTSService();

    _ttsService = TTSServiceImpl(
      TTSRepository(
        apiKey: supertoneApiKey,
        baseUrl: supertoneApiUrl,
        path: '/v1/text-to-speech',
        voiceId: 'c9858bccab131431a5c3c7',
      ),
    );
    _sttService = SpeechToTextService();
    _initServices();
    return const TTSState();
  }

  Future<void> _initServices() async {
    await _ttsService.init();
    await _sttService.init();
  }

  Future<void> toggleRecording() async {
    if (state.isRecording) {
      await _sttService.stopListening();
      state = state.copyWith(isRecording: false);
    } else {
      state = state.copyWith(isRecording: true);
      await _sttService.startListening((text) {
        state = state.copyWith(recordedText: text);
      });
    }
  }

  Future<void> speakText() async {
    if (state.inputText.isEmpty) return;

    state = state.copyWith(isSpeaking: true);
    // await _ttsService.speak({'text': state.inputText});
    await _ttsService.speak(SupertoneApiModel(text: state.inputText).toJson());
    state = state.copyWith(isSpeaking: false);
  }

  void updateInputText(String text) {
    state = state.copyWith(inputText: text);
  }

  void dispose() {
    _ttsService.dispose();
  }
}
