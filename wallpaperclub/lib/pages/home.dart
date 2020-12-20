import 'package:flutter/material.dart';
import 'package:wallpaperclub/helper/data.dart';
import 'package:wallpaperclub/modal/category_model.dart';
import 'package:wallpaperclub/pages/photo.dart';
import 'package:wallpaperclub/constant/Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wallpaperclub/pages/information.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
List<CategoryModel>catergories=new List<CategoryModel>();
List<Photo>wallpaper=new List();

getwallpaper() async {

  var response =await http.get("https://api.pexels.com/v1/search?query=nature",
   headers: {
      "Authorization": "2efc3571549fc0e7282bf364453445ec79339cc7"
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
    // TODO: implement initState
    catergories= getCategories();
    getwallpaper();
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

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              //search
            },
          )
        ],

      ),

      body: Container(

        color: Colors.black,
        child: Column(children: <Widget>[
          Container(
            height: 70,
            
            child:  ListView.builder(
                    itemCount: catergories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      
                      return CategoryTile(
                        categoryName: catergories[index].categoryName,
                        imageUrl: catergories[index].imageUrl,
                      );
                    })),
SizedBox(height: 16,),

wallpapersList(wallpaper: wallpaper, context: context),

 

          
                    
                    
          
          
          
        ],),
      ),

        
      
    );
  }
}

class CategoryTile extends StatelessWidget {
  final  imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(

      onTap: (){
      },

    
    
    child: Container(
      margin: EdgeInsets.only(right: 16),
      
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius:BorderRadius.circular(6),
           child: Image.network(imageUrl, width: 100,height:60, fit: BoxFit.cover,),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(categoryName,style: TextStyle(color: Colors.white,)),
           
          )
        ],
      ),

    ),
    );
  }
}