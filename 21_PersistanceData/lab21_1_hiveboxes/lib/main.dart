import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab21_1_hiveboxes/categories.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Box<Categories>? _categoriesBox;

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab #21.1 Hiveboxes'),
          centerTitle: true,
        ),
        body: Center(
          child: _categoriesBox == null
              ? const CircularProgressIndicator()
              : ValueListenableBuilder(
                  valueListenable: _categoriesBox!.listenable(),
                  builder: (context, Box<Categories> box, widget) {
                    return ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (_, index) {
                          final item = box.values.elementAt(index);
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black26, width: 1.0))),
                            child: Center(child: Text(item.name)),
                          );
                        });
                  }),
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            _addRecord('Movies');
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _addRecord(String name) async {
    _categoriesBox?.add(Categories(name));
  }

  void _removeFirst(String name) async {
    final rec = _categoriesBox!.values.first;
    rec.delete();
  }

  void _initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CategoriesAdapter());

    Hive.openBox<Categories>('categories').then((value) {
      setState(() {
        _categoriesBox = value;
      });
    });
  }
}
