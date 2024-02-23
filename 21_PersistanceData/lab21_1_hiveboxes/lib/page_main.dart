import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'categories.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Box<Categories>? _categoriesBox;
  final _newcatname = TextEditingController();

  @override
  void initState() {
    _initializeHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Категории'),
        centerTitle: true,
      ),
      body: Center(
        child: _categoriesBox == null
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  TextField(
                    controller: _newcatname,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 1.0),
                        ),
                        hintText: 'Введите новую категорию...'),
                  ),
                  Expanded(
                    child: ValueListenableBuilder(
                        valueListenable: _categoriesBox!.listenable(),
                        builder: (context, Box<Categories> box, widget) {
                          return ListView.builder(
                              itemCount: box.length,
                              itemBuilder: (_, index) {
                                final item = box.values.elementAt(index);
                                return Card(
                                  child: ListTile(
                                    title: Text(item.name),
                                    onTap: () =>
                                        Navigator.of(context).pushNamed(
                                      '/records',
                                      arguments: item,
                                    ),
                                  ),
                                );
                              });
                        }),
                  ),
                ],
              ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              _addRecord(_newcatname.text);
              _newcatname.text = "";
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              _removeFirst();
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void _addRecord(String name) async {
    if (name.isNotEmpty) {
      _categoriesBox?.add(Categories(name: name));
    }
  }

  void _removeFirst() async {
    if (_categoriesBox!.values.isNotEmpty) {
      final rec = _categoriesBox!.values.last;
      rec.delete();
    }
  }

  void _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CategoriesAdapter());
    Hive.registerAdapter(RecordAdapter());

    Hive.openBox<Categories>('database1').then((value) {
      setState(() {
        _categoriesBox = value;
      });
    });
  }
}
