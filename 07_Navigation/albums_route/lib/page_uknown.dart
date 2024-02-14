import 'package:flutter/material.dart';

class UnknownPage extends StatefulWidget {
  const UnknownPage({Key? key}) : super(key: key);

  static const routeName = '/unknownPage';

  @override
  State<UnknownPage> createState() {
    return _UnknownPageState();
  }
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[200],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Unknown Page'),
        ));
  }
}
