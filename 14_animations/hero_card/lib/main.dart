import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children: spaces
              .map((e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailView(data: e)));
                    },
                    child: Column(children: [
                      Hero(
                        tag: e.id,
                        child: Image.asset(e.image),
                      ),
                      Hero(
                        tag: '${e.id}-title',
                        child: Material(
                          child: Text(e.description, maxLines: 1),
                        ),
                      ),
                      Hero(
                        tag: '${e.id}-button',
                        child: Material(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: Colors.yellow,
                            child: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                    ]),
                  ))
              .toList()),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.data});
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: data.id,
            child: Image.asset(data.image),
          ),
          Hero(
            tag: '${data.id}-title',
            child: Material(child: Text(data.description)),
          ),
          Hero(
            tag: '${data.id}-button',
            child: Material(
                child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'More...',
              ),
            )),
          )
        ]),
      ),
    );
  }
}
