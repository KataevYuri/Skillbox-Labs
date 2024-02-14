import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab #18.3 - Google Map'),
        ),
        body: SizedBox(
          height: 400,
          width: double.infinity,
          child: Column(children: [
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => {}, child: const Text('-10'))),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => {}, child: const Text('+10')))
              ],
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          child: const Icon(
            Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
