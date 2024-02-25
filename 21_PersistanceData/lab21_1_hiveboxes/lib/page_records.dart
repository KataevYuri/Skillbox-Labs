import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lab21_1_hiveboxes/categories.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  Categories? _selectedCat;
  Box<Categories>? _categoriesBox;
  final Box<Categories> _box = Hive.box('database1');
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    _selectedCat = args as Categories;
    _categoriesBox = _box.get<Categories>(_selectedCat!);
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedCat!.name),
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: (n == null)
                  ? n
                  : ValueListenableBuilder(
                      valueListenable: _categoriesBox!.listenable(),
                      builder: (context, Box<Categories> box, widget) {
                        return ListView.builder(
                            itemCount: box.length,
                            itemBuilder: (_, index) {
                              final item = box.values.elementAt(index);
                              return Card(
                                child: ListTile(
                                  title: Text(item.name),
                                  onTap: () => Navigator.of(context).pushNamed(
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
    );
  }
}
