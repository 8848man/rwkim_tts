class SupertoneApiModel {
  final String text;
  final String? language;
  final String? style;
  final String? model;
  final Map<String, String>? voiceSettings;

  const SupertoneApiModel({
    required this.text,
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
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'text': text};

    if (language != null) data['language'] = language;
    if (style != null) data['style'] = style;
    if (model != null) data['model'] = model;
    if (voiceSettings != null) data['voiceSettings'] = voiceSettings;

    return data;
  }
}
