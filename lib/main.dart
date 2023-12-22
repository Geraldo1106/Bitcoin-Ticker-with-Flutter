import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp(initialCounter: 0));

class MyApp extends StatelessWidget {
  final int initialCounter;

  const MyApp({Key? key, this.initialCounter = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PriceScreen(initialCounter: initialCounter),
    );
  }
}
