import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:rwkim_tts/features/tts_service/models/tts_state.dart';
import 'package:rwkim_tts/features/tts_service/services/stt_service.dart';
import 'package:rwkim_tts/features/tts_service/services/tts_service.dart';
import 'package:rwkim_tts/features/tts_service/view_models/tts_view_model.dart';

@GenerateMocks([TTSService, STTService])
import 'tts_view_model_test.mocks.dart';

void main() {
  late MockTTSService mockTTSService;
  late MockSTTService mockSTTService;
  late TTSViewModel viewModel;

  setUp(() {
    mockTTSService = MockTTSService();
    mockSTTService = MockSTTService();
    viewModel = TTSViewModel();
  });

  group('TTSViewModel', () {
    test('initial state should be correct', () {
      expect(viewModel.state, const TTSState());
    });

    test('toggleRecording should update state correctly', () async {
      // Arrange
      when(mockSTTService.startListening(any)).thenAnswer((_) async {});
      when(mockSTTService.stopListening()).thenAnswer((_) async {});

      // Act
      await viewModel.toggleRecording();

      // Assert
      expect(viewModel.state.isRecording, true);

      // Act
      await viewModel.toggleRecording();

      // Assert
      expect(viewModel.state.isRecording, false);
    });

    test('speakText should call tts service and update state', () async {
      // Arrange
      const testText = 'Hello World';
      viewModel.updateInputText(testText);
      when(mockTTSService.speak(testText)).thenAnswer((_) async {});

      // Act
      await viewModel.speakText();

      // Assert
      verify(mockTTSService.speak(testText)).called(1);
      expect(viewModel.state.isSpeaking, false);
    });

    test('updateInputText should update state correctly', () {
      // Arrange
      const testText = 'Test Input';

      // Act
      viewModel.updateInputText(testText);

      // Assert
      expect(viewModel.state.inputText, testText);
    });
  });
} 