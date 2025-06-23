// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TTSState _$TTSStateFromJson(Map<String, dynamic> json) {
  return _TTSState.fromJson(json);
}

/// @nodoc
mixin _$TTSState {
  bool get isRecording => throw _privateConstructorUsedError;
  String get recordedText => throw _privateConstructorUsedError;
  String get inputText => throw _privateConstructorUsedError;
  bool get isSpeaking => throw _privateConstructorUsedError;

  /// Serializes this TTSState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TTSState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TTSStateCopyWith<TTSState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TTSStateCopyWith<$Res> {
  factory $TTSStateCopyWith(TTSState value, $Res Function(TTSState) then) =
      _$TTSStateCopyWithImpl<$Res, TTSState>;
  @useResult
  $Res call({
    bool isRecording,
    String recordedText,
    String inputText,
    bool isSpeaking,
  });
}

/// @nodoc
class _$TTSStateCopyWithImpl<$Res, $Val extends TTSState>
    implements $TTSStateCopyWith<$Res> {
  _$TTSStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TTSState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? recordedText = null,
    Object? inputText = null,
    Object? isSpeaking = null,
  }) {
    return _then(
      _value.copyWith(
            isRecording:
                null == isRecording
                    ? _value.isRecording
                    : isRecording // ignore: cast_nullable_to_non_nullable
                        as bool,
            recordedText:
                null == recordedText
                    ? _value.recordedText
                    : recordedText // ignore: cast_nullable_to_non_nullable
                        as String,
            inputText:
                null == inputText
                    ? _value.inputText
                    : inputText // ignore: cast_nullable_to_non_nullable
                        as String,
            isSpeaking:
                null == isSpeaking
                    ? _value.isSpeaking
                    : isSpeaking // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TTSStateImplCopyWith<$Res>
    implements $TTSStateCopyWith<$Res> {
  factory _$$TTSStateImplCopyWith(
    _$TTSStateImpl value,
    $Res Function(_$TTSStateImpl) then,
  ) = __$$TTSStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isRecording,
    String recordedText,
    String inputText,
    bool isSpeaking,
  });
}

/// @nodoc
class __$$TTSStateImplCopyWithImpl<$Res>
    extends _$TTSStateCopyWithImpl<$Res, _$TTSStateImpl>
    implements _$$TTSStateImplCopyWith<$Res> {
  __$$TTSStateImplCopyWithImpl(
    _$TTSStateImpl _value,
    $Res Function(_$TTSStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TTSState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRecording = null,
    Object? recordedText = null,
    Object? inputText = null,
    Object? isSpeaking = null,
  }) {
    return _then(
      _$TTSStateImpl(
        isRecording:
            null == isRecording
                ? _value.isRecording
                : isRecording // ignore: cast_nullable_to_non_nullable
                    as bool,
        recordedText:
            null == recordedText
                ? _value.recordedText
                : recordedText // ignore: cast_nullable_to_non_nullable
                    as String,
        inputText:
            null == inputText
                ? _value.inputText
                : inputText // ignore: cast_nullable_to_non_nullable
                    as String,
        isSpeaking:
            null == isSpeaking
                ? _value.isSpeaking
                : isSpeaking // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TTSStateImpl implements _TTSState {
  const _$TTSStateImpl({
    this.isRecording = false,
    this.recordedText = '',
    this.inputText = '',
    this.isSpeaking = false,
  });

  factory _$TTSStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TTSStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isRecording;
  @override
  @JsonKey()
  final String recordedText;
  @override
  @JsonKey()
  final String inputText;
  @override
  @JsonKey()
  final bool isSpeaking;

  @override
  String toString() {
    return 'TTSState(isRecording: $isRecording, recordedText: $recordedText, inputText: $inputText, isSpeaking: $isSpeaking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TTSStateImpl &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.recordedText, recordedText) ||
                other.recordedText == recordedText) &&
            (identical(other.inputText, inputText) ||
                other.inputText == inputText) &&
            (identical(other.isSpeaking, isSpeaking) ||
                other.isSpeaking == isSpeaking));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isRecording,
    recordedText,
    inputText,
    isSpeaking,
  );

  /// Create a copy of TTSState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TTSStateImplCopyWith<_$TTSStateImpl> get copyWith =>
      __$$TTSStateImplCopyWithImpl<_$TTSStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TTSStateImplToJson(this);
  }
}

abstract class _TTSState implements TTSState {
  const factory _TTSState({
    final bool isRecording,
    final String recordedText,
    final String inputText,
    final bool isSpeaking,
  }) = _$TTSStateImpl;

  factory _TTSState.fromJson(Map<String, dynamic> json) =
      _$TTSStateImpl.fromJson;

  @override
  bool get isRecording;
  @override
  String get recordedText;
  @override
  String get inputText;
  @override
  bool get isSpeaking;

  /// Create a copy of TTSState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TTSStateImplCopyWith<_$TTSStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
