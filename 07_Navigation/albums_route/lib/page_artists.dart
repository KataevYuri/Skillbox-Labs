import 'dart:convert';
import 'package:flutter/material.dart';
import 'fetch_file.dart';
import 'globals.dart' as globals;

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({Key? key}) : super(key: key);
  static const routeName = '/artists';

  @override
  createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  void _readJson() async {
    final Future<String> response = fetchFileFromAssets('assets/artists.json');
    final data = json.decode(await response);
    setState(() {
      globals.items = data;
    });
  }

  @override
  void initState() {
    _readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Artists',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            globals.items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: globals.items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          key: ValueKey(globals.items[index]["name"]),
                          margin: const EdgeInsets.all(10),
                          color: Colors.amber[300],
                          child: ListTile(
                            title: Text(globals.items[index]["name"]),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/about', arguments: {
                                'link': globals.items[index]["link"],
                              });
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
