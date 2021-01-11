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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "WallpaperClub",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body:Center(child: Container(
        color: Colors.black,
        child: Column(
          
          children: <Widget>[
          Container(child:
 Text(
          "Comming soon",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        
          
          ),
        ]
        )
      ),
      ),
      );
  }
}