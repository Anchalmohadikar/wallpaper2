
import 'dart:typed_data';

import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';


class Image_view extends StatefulWidget {
  final String imageUrl;
  Image_view({@required this.imageUrl});
  @override
  _Image_viewState createState() => _Image_viewState();
}

class _Image_viewState extends State<Image_view> {
  var filePath;
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
         _save();

   
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



_save() async{
  if(Platform.isAndroid){
    await _askPermission();
  }

    var response = await Dio().get(
      widget.imageUrl,
    options :Options(responseType:ResponseType.bytes));
  final result=
  await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
  print(result);
  Navigator.pop(context);
}
_askPermission() async{
if(Platform.isIOS){
  
    Map<PermissionGroup,PermissionStatus> permissions =
    await PermissionHandler()
      .requestPermissions([PermissionGroup.Photos]);
  
}
  else{
  
        PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
          }
          
        }
}
       
        