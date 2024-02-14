// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  final String caption;
  final dynamic text;
  static const Color kColor = Colors.black;
  static const double kFontSize = 14;

  const MyRichText({Key? key, required this.caption, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '$caption:\t\t',
          style: const TextStyle(color: kColor, fontSize: kFontSize)),
      TextSpan(
          text: '$text',
          style: const TextStyle(
              color: kColor, fontWeight: FontWeight.bold, fontSize: kFontSize)),
    ]));
  }
}

// платные и неплатные услуги имеют одинаковый подинтерфейс
class ServicesWidget extends StatelessWidget {
  const ServicesWidget({
    super.key,
    required this.caption,
    required this.services,
  });

  final String caption;
  final List<dynamic> services;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            caption,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ...services.map<Widget>((e) => Text(e)).toList(),
        ],
      ),
    );
  }
}

class EmptyDivider extends Divider {
  const EmptyDivider({super.key}) : super(thickness: 0.1);
}
