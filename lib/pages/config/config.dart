import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/providers.dart';
import '../About.dart';
import '../contact.dart';
import '../donate.dart';
import '../home.dart';
import '../search.dart';
import '../searchwall.dart';
import '../setting.dart';

class ConfigApp extends StatefulWidget {
  @override
  _ConfigAppState createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          'search': (context) => Search(),
          'searchwall': (context) => Searchwall(),
          'setting': (context) => Setting(),
          'About': (context) => About(),
          'contact': (context) => Contact(),
          'donate': (context) => Donate(),
           'home': (context) => Home(),
        },
      ),
    );
  }
}
