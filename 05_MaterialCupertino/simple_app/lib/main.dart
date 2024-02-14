// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// class TabItem {
//   String title;
//   Icon icon;
//   TabItem({required this.title, required this.icon});
// }

// final List<TabItem> _tabBar = [
//   TabItem(title: "Фото", icon: Icon(Icons.photo)),
//   TabItem(title: "Чат", icon: Icon(Icons.chat)),
//   TabItem(title: "Альбомы", icon: Icon(Icons.album))
// ];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Домашняя работа 5.5'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  // void openEndDrawer() {
  //   scaffoldKey.currentState?.openEndDrawer();
  // }

  void toggleBottomSheet() {
    if (_controller == null) {
      _controller =
          scaffoldKey.currentState?.showBottomSheet((context) => (Container(
                color: Colors.white,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.payment),
                          Text("Сумма"),
                          Text("200 руб.")
                        ]),
                    FilledButton(
                      onPressed: () {},
                      child: const Text("Оплатить"),
                    )
                  ],
                ),
              )));
    } else {
      _controller?.close();
      _controller = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
        // actions: [
        //   IconButton(
        //       onPressed: () => {openEndDrawer()}, icon: Icon(Icons.person_2))
        // ],
        actions: [
          Builder(
              builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: Icon(Icons.person_2)))
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          DrawerHeader(
              child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://avatars.mds.yandex.net/i?id=b288d3982f12432f794a554623bada0b_sr-6946731-images-thumbs&n=13"),
          )),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.forward),
          ),
          ListTile(
            title: Text("Profile"),
            leading: Icon(Icons.people_alt),
            trailing: Icon(Icons.forward),
          ),
          ListTile(
            title: Text("Images"),
            leading: Icon(Icons.image),
            trailing: Icon(Icons.forward),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('Выход')),
                      ElevatedButton(
                          onPressed: () {}, child: Text('Регистрация'))
                    ])),
          ))
        ]),
      ),
      endDrawer: Drawer(
          child: Column(children: [
        DrawerHeader(
          child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://avatars.mds.yandex.net/i?id=3f818543852cccb9b25dfd666e14d7d2f1830656-9095341-images-thumbs&n=13')),
        ),
        Expanded(
            child: Align(
          alignment: Alignment.center,
          child: Text('Фамилия Имя'),
        ))
      ])),
      bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          elevation: 1,
          child: BottomNavigationBar(
              elevation: 2,

              /// вот здесь параметр чтобы бар отбрасывал тень, но у меня не получилось видимо он сильно близко к краю
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Фото"),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Чат"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.album), label: "Альбомы"),
              ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          toggleBottomSheet();
        },
      ),
    );
  }
}
