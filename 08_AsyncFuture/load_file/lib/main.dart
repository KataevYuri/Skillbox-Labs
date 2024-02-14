import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'fetch_file.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Load file'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title = ''}) : super(key: key);

  final String title;

  @override
  createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      suffixIcon: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () => _onPressed(),
                        child: const Text(
                          "Найти",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: _getInformWidget()),
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    if (kDebugMode) {
      print(_controller.text);
    }
    setState(() {});
  }

  Widget _getInformWidget() {
    if (_controller.text == '') {
      return const Text('Введите имя файла...');
    } else {
      return FutureBuilder<String>(
        future: fetchFileFromAssets('assets/${_controller.text}'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Text(
                  "FILE NOT FOUND!",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(child: Text(snapshot.data)),
                );
              }

            default:
              return const Text('');
          }
        },
      );
    }
  }
}
