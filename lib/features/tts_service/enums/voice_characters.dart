part of './lib.dart';

const String _basePath = 'assets/images/';

enum VoiceCharacter {
  dustin('Dustin', 'c9858bccab131431a5c3c7', 'dustin.png'),
  walt('Walt', '2f3903463b4018c037cb75', 'walt.png'),
  geomac('Geomac', '1106496d78384aff4e6297', 'geomac.png'),
  yejin('Yejin', 'c9220df3a5a70647d7b022', 'yejin.png'),
  mira('Mira', 'e663f399f74eed734c5136', 'mira.png'),
  neo('Neo', '67095dcff78f31f46e3a0c', 'neo.png'),
  allen('Allen', 'd9411052b13cba9cb4c313', 'allen.png');

  const VoiceCharacter(this.displayName, this.id, this.filename);

  final String displayName;
  final String id;
  final String filename;

  String get imagePath => '$_basePath$filename';
}

final List<VoiceCharacter> voiceCharacters = [
  VoiceCharacter.dustin,
  VoiceCharacter.walt,
  VoiceCharacter.geomac,
  VoiceCharacter.yejin,
  VoiceCharacter.mira,
  VoiceCharacter.neo,
  VoiceCharacter.allen,
];

String getVoiceId(VoiceCharacter character) {
  return character.id;
}
