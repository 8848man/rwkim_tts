import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rwkim_tts/features/tts_service/enums/voice_characters.dart';

StateProvider<VoiceCharacters> nowCharacterProvider =
    StateProvider<VoiceCharacters>((ref) {
      return VoiceCharacters.dustin; // Default character
    });
