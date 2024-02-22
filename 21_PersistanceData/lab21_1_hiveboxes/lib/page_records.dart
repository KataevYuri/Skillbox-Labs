import 'package:flutter/material.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  String _recName = '';

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    _recName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_recName),
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('Records Page')),
          ],
        ),
      ),
    );
  }
}
