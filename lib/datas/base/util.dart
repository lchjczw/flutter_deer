import 'dart:math';

String randString({int strlenght = 12}) {
  String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';

  /// 生成的字符串固定长度
  String left = '';
  for (var i = 0; i < strlenght; i++) {
    // right = right + (min + (Random().nextInt(max - min))).toString();
    left = left + alphabet[Random().nextInt(alphabet.length)];
  }
  return left;
}
