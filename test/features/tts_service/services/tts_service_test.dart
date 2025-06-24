import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:rwkim_tts/features/tts_service/services/tts_service.dart';

@GenerateMocks([FlutterTts])
import 'tts_service_test.mocks.dart';

void main() {
  late MockFlutterTts mockFlutterTts;
  late FlutterTTSService ttsService;

  setUp(() {
    mockFlutterTts = MockFlutterTts();
    ttsService = FlutterTTSService();
  });

  group('FlutterTTSService', () {
    test('init should set language and other properties', () async {
      // Arrange
      when(mockFlutterTts.setLanguage('ko-KR')).thenAnswer((_) async => 1);
      when(mockFlutterTts.setSpeechRate(0.5)).thenAnswer((_) async => 1);
      when(mockFlutterTts.setVolume(1.0)).thenAnswer((_) async => 1);
      when(mockFlutterTts.setPitch(1.0)).thenAnswer((_) async => 1);

      // Act
      await ttsService.init();

      // Assert
      verify(mockFlutterTts.setLanguage('ko-KR')).called(1);
      verify(mockFlutterTts.setSpeechRate(0.5)).called(1);
      verify(mockFlutterTts.setVolume(1.0)).called(1);
      verify(mockFlutterTts.setPitch(1.0)).called(1);
    });

    test('speak should call tts.speak with correct text', () async {
      // Arrange
      const testText = 'Hello World';
      when(mockFlutterTts.speak(testText)).thenAnswer((_) async => 1);

      // Act
      await ttsService.speak(testText);

      // Assert
      verify(mockFlutterTts.speak(testText)).called(1);
    });

    test('stop should call tts.stop', () async {
      // Arrange
      when(mockFlutterTts.stop()).thenAnswer((_) async => 1);

      // Act
      await ttsService.stop();

      // Assert
      verify(mockFlutterTts.stop()).called(1);
    });
  });
} 