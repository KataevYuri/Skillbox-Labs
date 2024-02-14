import 'dart:math';

import '/data/get_data.dart';

import 'model.dart';

class DigitWords {
  final DigitWordsData digitWordsList = DigitWordsData();
  final DigitWordsLogic digitWordsLogic = DigitWordsLogic();

  String getRandomDigitWord() {
    final digitword = digitWordsLogic.getRandomWord(digitWordsList);
    return digitword;
  }

  String getApiWord(int num) {
    switch (num) {
      case 1:
        return DigitWordsApiData().getApiWord1(digitWordsList);
      case 2:
        return DigitWordsApiData().getApiWord2(digitWordsList);
      case 3:
        return DigitWordsApiData().getApiWord3(digitWordsList);

      default:
        return DigitWordsApiData().getApiWord1(digitWordsList);
    }
  }
}

class DigitWordsLogic {
  int _getRandomInt() {
    return Random().nextInt(9) + 1;
  }

  String _getWord(DigitWordsData words, int index) {
    return words[index] ?? '';
  }

  String getRandomWord(DigitWordsData words) {
    int i = _getRandomInt();
    return '$i: ${_getWord(words, i)}';
  }
}
