import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lab21_1_hiveboxes/categories.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  Box<Categories>? _recName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    _recName = args as Box<Categories>;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_recName!.name),
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
