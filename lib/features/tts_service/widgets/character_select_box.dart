import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSelectBox extends ConsumerWidget {
  const CharacterSelectBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 16, // 좌우 간격
        runSpacing: 16, // 위아래 간격
        children: [
          buildCharacterSelectBox('철수', 'assets/images/character1.png'),
          buildCharacterSelectBox('영희', 'assets/images/character2.png'),
          buildCharacterSelectBox('민수', 'assets/images/character3.png'),
          buildCharacterSelectBox('지영', 'assets/images/character4.png'),
          buildCharacterSelectBox('수빈', 'assets/images/character5.png'),
          // 더 추가 가능
        ],
      ),
    );
  }
}

Widget buildCharacterSelectBox(String name, String imagePath) {
  return SizedBox(
    width: 80,
    height: 104,
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(
            'assets/images/character.png',
          ), // Replace with your character image
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
