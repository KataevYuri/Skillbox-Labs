import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpe_state_management/app/theme.dart';
import 'package:simpe_state_management/domain/mobx/counter_state.dart';

import 'package:simpe_state_management/presentation/pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => CounterState(),
      child: MaterialApp(
        theme: lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
