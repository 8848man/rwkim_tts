import 'package:freezed_annotation/freezed_annotation.dart';

part 'tts_state.freezed.dart';
part 'tts_state.g.dart';

@freezed
class TTSState with _$TTSState {
  const factory TTSState({
    @Default(false) bool isRecording,
    @Default('') String recordedText,
    @Default('') String inputText,
    @Default(false) bool isSpeaking,
  }) = _TTSState;

  factory TTSState.fromJson(Map<String, dynamic> json) => _$TTSStateFromJson(json);
} 