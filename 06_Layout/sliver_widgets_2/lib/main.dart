// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework 6',
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

List<Widget> myData = List.generate(
    30,
    (index) => Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          color: Colors.cyan,
          child: Text('$index'),
        ));

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
                title: Text('Silver App Bar - Flexible Space Bar'),
                centerTitle: true,
                background: Stack(fit: StackFit.expand, children: <Widget>[
                  Image.network(
                      'https://avatars.mds.yandex.net/i?id=ab0d0159648e105bcbdb8a368a231a26_sr-6177852-images-thumbs&n=13',
                      fit: BoxFit.cover),
                  Positioned(
                      child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                  ))
                ])),
          ),
          SliverGrid.count(
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
            crossAxisCount: 3,
            children: [for (var item in myData) item],
          )
        ],
      ),
    );
  }
}
