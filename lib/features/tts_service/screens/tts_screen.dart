import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rwkim_tts/features/tts_service/view_models/tts_view_model.dart';
import 'package:rwkim_tts/features/tts_service/widgets/record_button.dart';
import 'package:rwkim_tts/features/tts_service/widgets/text_input_section.dart';

class TTSScreen extends ConsumerWidget {
  const TTSScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordedText = ref.watch(tTSViewModelProvider).recordedText;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TTS & STT Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '음성 인식 (STT)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const RecordButton(),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                recordedText.isEmpty ? '녹음된 텍스트가 여기에 표시됩니다.' : recordedText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              '텍스트 음성 변환 (TTS)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const TextInputSection(),
          ],
        ),
      ),
    );
  }
}
