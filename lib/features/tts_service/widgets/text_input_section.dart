import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rwkim_tts/features/tts_service/view_models/tts_view_model.dart';

class TextInputSection extends ConsumerWidget {
  const TextInputSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSpeaking = ref.watch(tTSViewModelProvider).isSpeaking;

    return Column(
      children: [
        TextField(
          onChanged:
              (text) =>
                  ref.read(tTSViewModelProvider.notifier).updateInputText(text),
          decoration: const InputDecoration(
            hintText: '텍스트를 입력하세요',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed:
              isSpeaking
                  ? null
                  : () => ref.read(tTSViewModelProvider.notifier).speakText(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          child: Text(
            isSpeaking ? '음성 출력 중...' : '음성 출력',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
