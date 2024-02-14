import '../domain/model.dart';

class DigitWordsApiData {
  String getApiWord1(DigitWordsData words) {
    return '1: ${words[1]}';
  }

  String getApiWord2(DigitWordsData words) {
    return '2: ${words[2]}';
  }

  String getApiWord3(DigitWordsData words) {
    return '3: ${words[3]}';
  }
}
