import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:rwkim_tts/features/tts_service/consts/default_voice_id.dart';

class TTSRepository {
  final String baseUrl;
  final String path;

  TTSRepository({required this.baseUrl, required this.path});

  Future<Uint8List> fetchTtsAudio(Map<String, dynamic> data) async {
    final uri = Uri.parse('$baseUrl$path/${data['voiceId'] ?? defaultVoiceId}');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('TTS API 호출 실패: ${response.statusCode}');
    }

    return response.bodyBytes;
  }
}
