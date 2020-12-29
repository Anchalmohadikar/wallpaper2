import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperclub/helper/data.dart';
import 'package:wallpaperclub/modal/category_model.dart';
import 'package:wallpaperclub/pages/photo.dart';
import 'package:wallpaperclub/constant/Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wallpaperclub/pages/information.dart';

class Image_view extends StatefulWidget {
  final String imageUrl;
  Image_view({@required this.imageUrl});
  @override
  _Image_viewState createState() => _Image_viewState();
}

class _Image_viewState extends State<Image_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
        Hero(
          tag: widget.imageUrl,
          child:  Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
  child:Image.network(widget.imageUrl, fit: BoxFit.cover,)),),

  Container(
    height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
    child:Column(
       mainAxisAlignment:MainAxisAlignment.end,
       children: <Widget>[
     GestureDetector(
       onTap: (){

         Navigator.pop(context);
       },
            child: Stack
          (
            children:<Widget> [
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width/2,
                color: Colors.black,
              ),



               Container(
                 height: 55,
          width: MediaQuery.of(context).size.width/2,
          padding: EdgeInsets.symmetric(horizontal:8, vertical: 8),

          decoration: BoxDecoration(border: Border.all(color: Colors.white60,width: 2),
          borderRadius: BorderRadius.circular(30),
          ),
        
          child:Column(children:<Widget> [

Text("Set as wallpaper",style: TextStyle(fontSize:15,color: Colors.white60),),
Text("Image will be save in your gallery",style: TextStyle(fontSize:9,color: Colors.white),)
          ],)
        ),
         SizedBox(height:16),
        Text("cancel",style: TextStyle(fontSize:13,color: Colors.red),),
        SizedBox(height:60),


    ],),
     ),
  
          ],







        )
        
        
        ),

      ],
      ),
    );
  }
}