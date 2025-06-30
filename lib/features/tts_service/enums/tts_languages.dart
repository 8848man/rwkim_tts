part of './lib.dart';

enum TtsLanguages {
  korean('ko'),
  english('en'),
  japanese('ja');

  const TtsLanguages(this.value);
  final String value;
}
