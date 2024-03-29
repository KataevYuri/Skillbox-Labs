import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        appBar: CustomAppBarFixTitle(),
        body: Center(
          child: Text('Lab #22. Custom App bar'),
        ),
      ),
    );
  }
}

class CustomAppBarFixTitle extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarFixTitle({
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      centerTitle: true,
      title: const Text('Lab #22.Title'),
    );
  }
}
