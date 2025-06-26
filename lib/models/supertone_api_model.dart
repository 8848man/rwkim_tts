import 'package:rwkim_tts/features/tts_service/consts/default_voice_id.dart';

class SupertoneApiModel {
  final String text;
  final String? language;
  final String? style;
  final String? model;
  final Map<String, String>? voiceSettings;
  final String voiceId; // Default voice ID

  const SupertoneApiModel({
    required this.text,
    required this.voiceId,
    this.language,
    this.style,
    this.model,
    this.voiceSettings,
  });

  SupertoneApiModel.fromJson(Map<String, dynamic> json)
    : text = json['text'] as String,
      language = json['language'] as String?,
      style = json['style'] as String?,
      model = json['model'] as String?,
      voiceSettings = (json['voiceSettings'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, value as String),
      ),
      voiceId = json['voiceId'] as String? ?? defaultVoiceId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'text': text, 'voiceId': voiceId};

    if (language != null) data['language'] = language;
    if (style != null) data['style'] = style;
    if (model != null) data['model'] = model;
    if (voiceSettings != null) data['voiceSettings'] = voiceSettings;

    return data;
  }
}
