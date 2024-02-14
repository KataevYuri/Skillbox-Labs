import 'package:flutter/material.dart';
import 'page_artists.dart';
import 'page_uknown.dart';
import 'page_about.dart';
import 'page_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Work 7',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return const UnknownPage();
        });
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MyHomePage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const MyHomePage();
            });
          case ArtistsPage.routeName:
            return MaterialPageRoute(builder: (BuildContext context) {
              return const ArtistsPage();
            });
          case AboutPage.routeName:
            final args = settings.arguments as Map<String, dynamic>;

            return MaterialPageRoute(builder: (BuildContext context) {
              if (args.containsKey('link')) {
                return AboutPage(link: args['link']);
              } else {
                return const UnknownPage();
              }
            });
        }
        return null;
      },
    );
  }
}
