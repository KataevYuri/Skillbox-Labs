import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:simpe_state_management/app/theme.dart';

import 'package:simpe_state_management/presentation/pages/home_page.dart';

import '../domain/redux/app_state.dart';
import '../domain/redux/middlewares.dart';
import '../domain/redux/reducer.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store(reducer,
        middleware: [loaderMiddleware],
        initialState: AppState(
          countInCart: 0,
          plist: const Text('data'),
        ));
    return StoreProvider(
        store: store,
        child: MaterialApp(
          theme: lightTheme,
          home: const HomePage(),
        ));
  }
}
