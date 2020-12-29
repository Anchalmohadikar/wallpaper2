import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperclub/helper/data.dart';
import 'package:wallpaperclub/modal/category_model.dart';
import 'package:wallpaperclub/pages/photo.dart';
import 'package:wallpaperclub/constant/Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wallpaperclub/pages/information.dart';

class Category extends StatefulWidget {
  final String categoryName;
  Category({this.categoryName});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

   List<Photo>wallpaper=new List();

  getsearchwallpaper(String query) async {

  var response =await http.get("https://api.pexels.com/v1/search?query=$query&per_page=1",
   headers: {
      "Authorization": "563492ad6f917000010000014cf4949fca7045f6b73fab576533a5da"
    });
      print(response.body.toString());
      Map<String,dynamic>jsonData =jsonDecode(response.body);
      jsonData["photos"].forEach((element){

        //print(element);
        Photo photo = new Photo() ;
        photo = Photo.fromJson(element);
        wallpaper.add(photo);




      });



      

    setState(() {});
  }

  @override
  void initState() {
    getsearchwallpaper(widget.categoryName);
    // TODO: implement initState
    super.initState();
  }
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

      body:SingleChildScrollView(
      child: Container(

        color: Colors.black,
        child: Column(children: <Widget>[
          wallpapersList(wallpaper: wallpaper, context: context),
        ]
        )
      ),


      ),
    );
  }
}