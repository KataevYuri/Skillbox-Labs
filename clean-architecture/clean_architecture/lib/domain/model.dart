typedef DigitWordsType = Map<int, String>;

class DigitWordsData {
  DigitWordsType words = {
    1: 'One',
    2: 'Two',
    3: 'Three',
    4: 'Four',
    5: 'Five',
    6: 'Six',
    7: 'Seven',
    8: 'Eight',
    9: 'Nine',
  };

  operator [](int i) => words[i];

  @override
  String toString() => 'DigitWordsModel(_words: $words)';
}
