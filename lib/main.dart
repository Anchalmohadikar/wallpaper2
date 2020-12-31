import 'package:flutter/material.dart';
import 'package:wallpaperclub/pages/home.dart';
import 'package:wallpaperclub/pages/search.dart';
import 'package:wallpaperclub/pages/searchwall.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        'search': (context) => Search(),
        'searchwall': (context) => Searchwall(),
      },
    );
  }
}
