import 'package:flutter/material.dart';

import '../views/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(backgroundColor: Colors.purple[400])),
      home: const HomePage(),
    );
  }
}
