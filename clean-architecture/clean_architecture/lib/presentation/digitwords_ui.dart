// Presentation
import 'package:flutter/material.dart';
import '../domain/repository.dart';

class WordWidgetUI extends StatelessWidget {
  final bool? isRandom;
  const WordWidgetUI({
    this.isRandom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isRandom ?? true
        ? Text(DigitWords().getRandomDigitWord())
        : Text(DigitWords().getApiWord(1));
  }
}
