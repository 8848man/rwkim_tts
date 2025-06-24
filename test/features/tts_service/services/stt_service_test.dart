import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:rwkim_tts/features/tts_service/services/stt_service.dart';

@GenerateMocks([SpeechToText])
import 'stt_service_test.mocks.dart';

void main() {
  late MockSpeechToText mockSpeechToText;
  late SpeechToTextService sttService;

  setUp(() {
    mockSpeechToText = MockSpeechToText();
    sttService = SpeechToTextService();
  });

  group('SpeechToTextService', () {
    test('init should initialize speech to text', () async {
      // Arrange
      when(mockSpeechToText.initialize(
        onError: anyNamed('onError'),
        onStatus: anyNamed('onStatus'),
      )).thenAnswer((_) async => true);

      // Act
      await sttService.init();

      // Assert
      verify(mockSpeechToText.initialize(
        onError: anyNamed('onError'),
        onStatus: anyNamed('onStatus'),
      )).called(1);
    });

    test('startListening should start listening with correct locale', () async {
      // Arrange
      when(mockSpeechToText.listen(
        onResult: anyNamed('onResult'),
        localeId: 'ko_KR',
      )).thenAnswer((_) async => true);

      // Act
      await sttService.startListening((text) {});

      // Assert
      verify(mockSpeechToText.listen(
        onResult: anyNamed('onResult'),
        localeId: 'ko_KR',
      )).called(1);
    });

    test('stopListening should stop listening', () async {
      // Arrange
      when(mockSpeechToText.stop()).thenAnswer((_) async => true);

      // Act
      await sttService.stopListening();

      // Assert
      verify(mockSpeechToText.stop()).called(1);
    });

    test('isListening should return correct value', () {
      // Arrange
      when(mockSpeechToText.isListening).thenReturn(true);

      // Act
      final result = sttService.isListening;

      // Assert
      expect(result, true);
    });
  });
} 