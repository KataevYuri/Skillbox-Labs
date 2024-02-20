import 'package:flutter/material.dart';
import '../presentation/digitwords_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget? titleword;

  @override
  void initState() {
    super.initState();
    titleword = const WordWidgetUI();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Clean Architecture Practice'),
        ),
        body: Center(
          child: titleword,
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Get word'),
          onPressed: () => setState(() {
            // ignore: prefer_const_constructors
            titleword = WordWidgetUI(
              isRandom: true,
            );
          }),
        ),
      ),
    );
  }
}
