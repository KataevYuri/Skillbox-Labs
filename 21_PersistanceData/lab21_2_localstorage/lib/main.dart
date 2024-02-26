import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late TextEditingController _file;
  List<String> images = [];
  late String localPath;

  @override
  void initState() {
    super.initState();
    _file = TextEditingController();
    _file.text = 'https://free-images.com/md/4275/penguin_funny_blue_water.jpg';
    //initialize();
  }

  @override
  void dispose() {
    _file.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Games'),
        ),
        body: Center(
          child: Column(
            children: [
              (images.isEmpty)
                  ? const Text('No Files')
                  : ListView.separated(
                      itemCount: images.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Image.file(File(images[index])),
                          subtitle: Text(images[index]),
                        );
                      },
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    TextField(
                      controller: _file,
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.download)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void initialize() async {
    localPath = (await getApplicationDocumentsDirectory()).path;
  }
}
