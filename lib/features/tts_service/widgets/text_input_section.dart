import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rwkim_tts/features/tts_service/providers/audio_player_provider.dart';
import 'package:rwkim_tts/features/tts_service/providers/audio_progress_provider.dart';
import 'package:rwkim_tts/features/tts_service/view_models/tts_view_model.dart';

class TextInputSection extends ConsumerWidget {
  const TextInputSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSpeaking = ref.watch(tTSViewModelProvider).isSpeaking;

    return Column(
      children: [
        TextField(
          onChanged: (text) =>
              ref.read(tTSViewModelProvider.notifier).updateInputText(text),
          decoration: const InputDecoration(
            hintText: '텍스트를 입력하세요',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: isSpeaking
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
        SizedBox(width: 300, child: const AudioProgressBar()),
        const AudioControls(),
      ],
    );
  }
}

class AudioProgressBar extends ConsumerWidget {
  const AudioProgressBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(positionProvider).value ?? Duration.zero;
    final duration = ref.watch(durationProvider).value ?? Duration.zero;

    return Slider(
      value: position.inMilliseconds.toDouble(),
      max: duration.inMilliseconds.toDouble(),
      onChanged: (value) {
        ref
            .read(audioPlayerProvider)
            .seek(Duration(milliseconds: value.toInt()));
      },
    );
  }
}

class AudioControls extends ConsumerWidget {
  const AudioControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(audioPlayerProvider);
    final playerState = ref.watch(playerStateProvider);
    return playerState.when(
      data: (state) {
        if (state == PlayerState.playing) {
          return IconButton(
            icon: const Icon(Icons.pause),
            onPressed: () => player.pause(),
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () => player.resume(),
          );
        }
      },
      loading: () => IconButton(
        icon: const Icon(Icons.play_arrow),
        onPressed: () => ref.read(tTSViewModelProvider.notifier).speakText(),
      ),
      error: (_, __) => const Icon(Icons.error),
    );
  }
}
