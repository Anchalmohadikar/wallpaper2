import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [



            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100.0,
                height: 100.0,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                     border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1601758282760-b6cc3d07523d?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                      ),
                      fit: BoxFit.fill,
                    ),
                   
                   
                    ),
              ),

              Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(
                10.0,
              ),
              child: Text(
                'About us',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 30.0,
                ),
              ),
            ),
              Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                    right: 15.0,
                  ),
                  child: Divider(
                    color: Colors.blue,
                    height: 50,
                    thickness: 3,
                  )),
              
              Container(
                margin: const EdgeInsets.only(
                  left: 10.0,
                  right: 15.0,
                ),
                child: Text(
                  'WallpaperClub is one of the best app.Its a great collection of the  uniques wallpapers.In this app you can get wallpapers as your wish. Additionally,This app comes with the features like , download function, share,and more.The wallpapers of the wallpaperClub is with high resolution for any phone screen. The UI of this  app is very simple to use and user friendly.This app with 1000+ wallpapers more  newly per day.It is completly free and easily accessible app. ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
              ),
SizedBox(height:16),
              Container(
              
              margin: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
              
              child: Text(
                'Developed by: Anchal Mohadikar',
     textAlign: TextAlign.left,

                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
            ),

            Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                    right: 15.0,
                  ),
                  child: Divider(
                    color: Colors.blue,
                    height: 50,
                    thickness: 3,
                  )),

                  Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                    right: 15.0,
                  ),
                  child:Row(children: <Widget>[

                   
              

             IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.github,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
 IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.linkedin,
                                        color: Colors.white,
                                      ),
                                      onPressed: () 
                                      
                                      {}
                                    ),

                                     IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),




                  ],)
                  
                  
                  ),




                  SizedBox(height:40),

                   Container(
                     height: 60,
                  margin: const EdgeInsets.only(
                     left: 10.0,
                    right: 15.0,
                  ),
                  
                  color:Colors. black,

                  
              child: Text(
                '@ Copyright 2021 FrazileMedia.All Rights Reserved ',
    textAlign: TextAlign.left,

                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0,
                ),
              ),
                  
                  ),

                  SizedBox(height:19),

              
            ],
          ),




        ]
       ),
      
    );
  }
}