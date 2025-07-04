enum VoiceCharacters {
  dustin('Dustin', 'c9858bccab131431a5c3c7', 'dustin.png'),
  walt('Walt', '2f3903463b4018c037cb75', 'walt.png'),
  geomac('Geomac', '1106496d78384aff4e6297', 'geomac.png'),
  yejin('Yejin', 'c9220df3a5a70647d7b022', 'yejin.png'),
  mira('Mira', 'e663f399f74eed734c5136', 'mira.png'),
  neo('Neo', '67095dcff78f31f46e3a0c', 'neo.png'),
  allen('Allen', 'd9411052b13cba9cb4c313', 'allen.png');

  const VoiceCharacters(this.displayName, this.id, this.filename);

  final String displayName;
  final String id;
  final String filename;

  static const String _basePath = 'lib/assets/images/';

  String get imagePath => '$_basePath$filename';
}
