import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key, required this.link}) : super(key: key);

  static const routeName = '/about';
  final String link;

  @override
  State<AboutPage> createState() {
    return _AboutPageState();
  }
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map artist =
        globals.items.firstWhere((element) => element['link'] == widget.link);

    return Scaffold(
        appBar: AppBar(
            title: Text(
          artist['name'],
        )),
        body: SafeArea(
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              artist['about'],
            ),
          ),
        ));
  }
}
