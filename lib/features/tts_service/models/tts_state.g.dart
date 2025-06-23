// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tts_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TTSStateImpl _$$TTSStateImplFromJson(Map<String, dynamic> json) =>
    _$TTSStateImpl(
      isRecording: json['isRecording'] as bool? ?? false,
      recordedText: json['recordedText'] as String? ?? '',
      inputText: json['inputText'] as String? ?? '',
      isSpeaking: json['isSpeaking'] as bool? ?? false,
    );

Map<String, dynamic> _$$TTSStateImplToJson(_$TTSStateImpl instance) =>
    <String, dynamic>{
      'isRecording': instance.isRecording,
      'recordedText': instance.recordedText,
      'inputText': instance.inputText,
      'isSpeaking': instance.isSpeaking,
    };
