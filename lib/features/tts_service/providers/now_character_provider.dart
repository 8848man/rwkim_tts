import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rwkim_tts/features/tts_service/enums/voice_characters.dart';

StateProvider<VoiceCharacter> nowCharacterProvider =
    StateProvider<VoiceCharacter>((ref) {
      return VoiceCharacter.dustin; // Default character
    });
