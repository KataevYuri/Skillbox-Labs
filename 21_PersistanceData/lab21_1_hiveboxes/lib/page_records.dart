import 'package:flutter/material.dart';
import 'package:lab21_1_hiveboxes/categories.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  Categories? _selectedCat;
  final _newrec = TextEditingController();

  @override
  void didChangeDependencies() async {
    final args = ModalRoute.of(context)?.settings.arguments;
    _selectedCat = args as Categories;
    setState(() {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedCat!.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _newrec,
            decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.0),
                ),
                hintText: 'Введите новую запись...'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedCat!.records.length,
              itemBuilder: (_, index) {
                final item = _selectedCat!.records.elementAt(index);
                return Card(
                  child: ListTile(title: Text(item.name), onTap: () => Null
                      // Navigator.of(context).pushNamed(
                      //   '/records',
                      //   arguments: item,
                      // ),
                      ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              _addRecord(_newrec.text);
              _newrec.text = "";
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _addRecord(String name) {
    if (name.isNotEmpty) {
      final r = Record(name);
      _selectedCat!.records.add(r);

      setState(() {});
    }
  }
}
