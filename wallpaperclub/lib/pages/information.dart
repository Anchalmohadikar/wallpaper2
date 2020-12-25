import 'package:flutter/material.dart';
import 'package:wallpaperclub/pages/photo.dart';
import 'package:wallpaperclub/constant/Global.dart';

Widget wallpapersList({List<Photo>wallpaper,context}){

return Container(
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
                      
                    
                  
                
              
    
);
    
}

