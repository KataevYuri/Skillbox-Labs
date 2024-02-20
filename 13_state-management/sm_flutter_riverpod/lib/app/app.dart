import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simpe_state_management/app/theme.dart';
import 'package:simpe_state_management/presentation/pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      theme: lightTheme,
      home: const HomePage(),
    ));
  }
}
