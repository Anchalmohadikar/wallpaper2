import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:file_utils/file_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Image_view extends StatefulWidget {
  final String imageUrl;
  Image_view({@required this.imageUrl});
  @override
  Image_viewState createState() => Image_viewState();
}

class Image_viewState extends State<Image_view> {
  var imagePath;
  bool downloading = false;
  var progress = "";
  PermissionGroup permission1 = PermissionGroup.storage;
  static final Random random = Random();
  Dio dio = Dio();

  void downloadFile(String imageUrl) async {
    bool checkPermission1;
    final List<PermissionGroup> permissions = <PermissionGroup>[permission1];
    await PermissionHandler().checkPermissionStatus(permission1).then(
      (PermissionStatus status) {
        setState(
          () {
            if (status == PermissionStatus.denied) {
              checkPermission1 = false;
            } else {
              if (status == PermissionStatus.granted) {
                checkPermission1 = true;
              }
            }
          },
        );
      },
    );
    // print(checkPermission1);
    if (checkPermission1 == false) {
      await PermissionHandler().requestPermissions(permissions);
      await PermissionHandler().checkPermissionStatus(permission1).then(
        (PermissionStatus status) {
          setState(
            () {
              if (status == PermissionStatus.denied) {
                checkPermission1 = false;
              } else {
                if (status == PermissionStatus.granted) {
                  checkPermission1 = true;
                }
              }
            },
          );
        },
      );
    }
    if (checkPermission1 == true) {
      
   
     var randid = random.nextInt(10000);

      try {
        
        await dio.download(
          imageUrl,
         
          onReceiveProgress: (receivedBytes, totalBytes) {
            setState(
              () {
              
                downloading = true;
                progress =
                    ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) +
                        "%";
              },
            );
          },
        );
      } catch (e) {
        print(e);
      }

      setState(
        () {
          progress = "Download Completed.";
         
          downloading = false;
        },
      );
    } else {
      setState(
        () {
          progress = "Permission not accepted";
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imageUrl,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: <Widget>[
                     Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 2,
                        color: Colors.transparent,
                        

                      ),


                       Positioned(
                        bottom: MediaQuery.of(context).size.height * .07,
                        left: MediaQuery.of(context).size.width * .08,
                        right: MediaQuery.of(context).size.width * .27,
                        child: MaterialButton(
                          splashColor: Colors.grey[100],
                          color: Colors.white.withOpacity(.47),
                          textColor: Colors.white,
                          elevation: 5.0,
                          height: 40.0,
                          // focusColor: Colors.orange,
                          // minWidth: 50.0,
                          child: Text("Download"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          onPressed: () => downloadFile(args.imageUrl),
                        ),
                      ),
                      Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width / 2,
                        
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white60, width: 2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Set as wallpaper",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white60),
                              ),
                              Text(
                                "Image will be save in your gallery",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),

                              
                            ],
                          )),

                          
                     
                               SizedBox(height: 60),
                    ],


                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
