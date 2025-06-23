import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rwkim_tts/features/tts_service/enums/voice_characters.dart';
import 'package:rwkim_tts/features/tts_service/providers/now_character_provider.dart';

class CharacterSelectBox extends ConsumerWidget {
  CharacterSelectBox({super.key});

  final List<VoiceCharacters> voiceCharacters = [
    VoiceCharacters.dustin,
    VoiceCharacters.walt,
    VoiceCharacters.geomac,
    VoiceCharacters.yejin,
    VoiceCharacters.mira,
    VoiceCharacters.neo,
    VoiceCharacters.allen,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 16, // 좌우 간격
        runSpacing: 16, // 위아래 간격
        children: [
          ...List.generate(
            voiceCharacters.length,
            (index) =>
                buildCharacterSelectBox(context, ref, voiceCharacters[index]),
          ),
          // 더 추가 가능
        ],
      ),
    );
  }
}

Widget buildCharacterSelectBox(
  BuildContext context,
  WidgetRef ref,
  VoiceCharacters character,
) {
  return GestureDetector(
    onTap: () {
      ref.read(nowCharacterProvider.notifier).update((state) => character);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${character.name} 캐릭터가 선택되었습니다.'),
          duration: const Duration(milliseconds: 700),
        ),
      );
      Navigator.of(context).pop(); // 다이얼로그 닫기
    },
    child: SizedBox(
      width: 80,
      height: 104,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              character.imagePath, // 캐릭터 이미지 경로
            ), // Replace with your character image
          ),
          const SizedBox(height: 8),
          Text(
            character.name, // 캐릭터 이름
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
