import 'package:wallpaperclub/pages/searchwall.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(fit: StackFit.expand, children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(
              10.0,
            ),
            child: Text(
              'Comming soon',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 30.0,
              ),
            ),
          ),
        ]));
  }
}
