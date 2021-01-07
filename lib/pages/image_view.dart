import 'package:flutter/material.dart';

class Imageview extends StatefulWidget {
  final String imageUrl;
  Imageview({@required this.imageUrl});
  @override
  ImageviewState createState() => ImageviewState();
}

class ImageviewState extends State<Imageview> {
  var imagePath;
  bool downloading = false;
  var progress = "";

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
                          onPressed: () {},
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
                        ),
                      ),
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
