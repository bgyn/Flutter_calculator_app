import 'package:flutter/material.dart';
import 'package:profile12/screen/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.amber, brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: homeScreen(),
    );
  }
}
