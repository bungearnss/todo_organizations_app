import 'package:flutter/material.dart';

import './screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Store<AppState> store = DevToolsStore<AppState>(
    //   appStateReducer,
    //   initialState: AppState.initialState(),
    //   middleware: [appStateMiddleware],
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redux Items',
      theme: ThemeData(
        fontFamily: 'Karla',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(123, 123, 123, 1),
          ),
        ),
        accentColor: const Color.fromRGBO(120, 105, 250, 1),
        dividerColor: Colors.transparent,
      ),
      home: const NavigatorScreen(),
    );
  }
}
