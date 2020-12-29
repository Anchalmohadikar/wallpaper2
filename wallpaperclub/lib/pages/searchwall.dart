import 'package:flutter/material.dart';
import 'package:wallpaperclub/helper/data.dart';
import 'package:wallpaperclub/modal/category_model.dart';
import 'package:wallpaperclub/pages/photo.dart';
import 'package:wallpaperclub/constant/Global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wallpaperclub/pages/information.dart';

class Searchwall extends StatefulWidget {
  final String searchwallQuery;
  Searchwall({this.searchwallQuery});
  
  @override
  
  _SearchwallState createState() => _SearchwallState();
}

class _SearchwallState extends State<Searchwall> {
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
    // TODO: implement initState
    getsearchwallpaper(widget.searchwallQuery);
    super.initState();
    searchController.text=widget.searchwallQuery;
    
  }
  TextEditingController searchController = new TextEditingController();
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
          Container(
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal:24),
            margin: EdgeInsets.symmetric(horizontal:24),

         child: Row(children: <Widget>[
            Expanded(

         child: TextFormField(
                    
                  controller: searchController,
                    decoration: InputDecoration(
                      //suffixIcon: Icon(Icons.search),

                      
                      
                      labelText: 'search wallpaper',
                    
                
                  
                      

                    ),




         

            ),),

            GestureDetector(
              onTap: (){
                getsearchwallpaper(searchController.text);
                  //search
              },
              child:Container(child:
             Icon(Icons.search,color: Colors.red),
              ),),


            
          ]
          )
          ),

          SizedBox(height: 16,),

 Container(
color: Colors.black,


             
  child:  
    GridView.count(
              
                 shrinkWrap: true,
                 physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                
                
                    crossAxisCount: 3,
                     
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.5,
                    children: wallpaper.map((wallpaper){
               
                  return GridTile(
                  
                    child: Container(
                      
 



                        color: Colors.black,
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                       child: Image.network(wallpaper.src.portrait, fit:BoxFit.cover),

                              
                          ),
                    ),
                  );


                  
                  
            

                    }
                    ).toList(),
                          
                        ),
                      
                    
                  
                
              
    
),
        ]
        ),),),
    );
  }
}
