import 'package:flutter/material.dart';
import "screens/loading_screen.dart";


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        primaryColor: Color(0xff1d1b38)
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

