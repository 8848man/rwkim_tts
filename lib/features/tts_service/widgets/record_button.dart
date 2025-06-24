import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rwkim_tts/features/tts_service/view_models/tts_view_model.dart';

class RecordButton extends ConsumerWidget {
  const RecordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRecording = ref.watch(tTSViewModelProvider).isRecording;

    return ElevatedButton(
      onPressed:
          () => ref.read(tTSViewModelProvider.notifier).toggleRecording(),
      style: ElevatedButton.styleFrom(
        backgroundColor: isRecording ? Colors.red : Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      ),
      child: Text(
        isRecording ? '녹음 종료' : '녹음 시작',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
