import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 4.6',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final List<String> nav = ['Мои Фото', 'Галерея'];

  Map<String, dynamic> data = {
    'Мои фото': [
      'https://img.freepik.com/premium-photo/black-t-shirts-with-copy-space_53876-102012.jpg?size=626&ext=jpg',
      'https://img.freepik.com/free-psd/elegant-certificate-template-with-geometric-shapes_69286-457.jpg?size=626&ext=jpg&ga=GA1.1.2083409455.1687368232',
    ],
    'Галерея': [
      'https://img.freepik.com/free-psd/beautiful-certificate-template-with-watercolor-splashes_69286-465.jpg?size=626&ext=jpg',
      'https://img.freepik.com/free-psd/startup-business-presentation-template-psd-set_53876-145271.jpg?size=626&ext=jpg',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Homework 4.6'),
          bottom: TabBar(
            tabs: [for (String item in data.keys) Tab(text: item)],
          ),
        ),
        body: TabBarView(children: [
          for (String item in data.keys)
            ListView(key: PageStorageKey(item), children: [
              for (String picname in data[item]!) Image.network(picname)
            ])
        ]),
      ),
    );
  }
}
