import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class TTSRepository {
  // final http.Client client;
  final String apiKey;
  final String baseUrl; // e.g. https://supertoneapi.com
  final String path; // e.g. /v1/text-to-speech/abc123
  final String voiceId; // 모델 ID, 필요시 변경

  TTSRepository({
    // required this.client,
    required this.apiKey,
    required this.baseUrl,
    required this.path,
    required this.voiceId,
  });

  Future<Uint8List> fetchTtsAudio(Map<String, dynamic> data) async {
    final uri = Uri.parse('$baseUrl$path/$voiceId');

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json', 'x-sup-api-key': apiKey},
      body: jsonEncode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('TTS API 호출 실패: ${response.statusCode}');
    }

    return response.bodyBytes;
  }
}
