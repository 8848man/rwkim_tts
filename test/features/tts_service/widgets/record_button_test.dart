import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rwkim_tts/features/tts_service/models/tts_state.dart';
import 'package:rwkim_tts/features/tts_service/view_models/tts_view_model.dart';
import 'package:rwkim_tts/features/tts_service/widgets/record_button.dart';

void main() {
  testWidgets('RecordButton shows correct text based on recording state',
      (WidgetTester tester) async {
    // Arrange
    final container = ProviderContainer(
      overrides: [
        tTSViewModelProvider.overrideWith((ref) => TTSViewModel()),
      ],
    );

    // Act
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: Scaffold(
            body: RecordButton(),
          ),
        ),
      ),
    );

    // Assert
    expect(find.text('녹음 시작'), findsOneWidget);

    // Act - Start recording
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Assert
    expect(find.text('녹음 종료'), findsOneWidget);

    // Act - Stop recording
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Assert
    expect(find.text('녹음 시작'), findsOneWidget);
  });

  testWidgets('RecordButton has correct colors', (WidgetTester tester) async {
    // Arrange
    final container = ProviderContainer(
      overrides: [
        tTSViewModelProvider.overrideWith((ref) => TTSViewModel()),
      ],
    );

    // Act
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: Scaffold(
            body: RecordButton(),
          ),
        ),
      ),
    );

    // Assert - Initial state (blue)
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(
      (button.style as ButtonStyle).backgroundColor?.resolve({}),
      Colors.blue,
    );

    // Act - Start recording
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Assert - Recording state (red)
    final recordingButton =
        tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(
      (recordingButton.style as ButtonStyle).backgroundColor?.resolve({}),
      Colors.red,
    );
  });
} 