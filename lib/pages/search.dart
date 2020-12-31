import 'package:flutter/material.dart';
import 'package:wallpaperclub/pages/searchwall.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
      body: Container(
        color: Colors.black,
        child: Column(children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      //suffixIcon: Icon(Icons.search),

                      labelText: 'search wallpaper',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Searchwall(
                                  searchwallQuery: searchController.text,
                                ))); //search
                  },
                  child: Container(
                    child: Icon(Icons.search, color: Colors.red),
                  ),
                ),
              ])),
        ]),
      ),
    );
  }
}
