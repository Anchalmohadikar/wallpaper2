import 'package:flutter/material.dart';
import 'package:wallpaperclub/helper/data.dart';
import 'package:wallpaperclub/modal/category_model.dart';
import 'package:wallpaperclub/pages/category.dart';
import 'package:wallpaperclub/pages/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wallpaperclub/pages/information.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> catergories = <CategoryModel>[];
  List<Photo> wallpaper = [];

  getwallpaper() async {
    var response = await http
        .get("https://api.pexels.com/v1/search?query=nature", headers: {
      "Authorization":
          "563492ad6f917000010000014cf4949fca7045f6b73fab576533a5da"
    });
    print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      //print(element);
      Photo photo = Photo();
      photo = Photo.fromJson(element);
      wallpaper.add(photo);
    });

    setState(() {});
  }

  @override
  void initState() {
    catergories = getCategories();
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
              Navigator.of(context).pushNamed(
                'search',
              );
              //search
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://play-lh.googleusercontent.com/XDFSs2DHhEbLwovKULM51pZ2CQcWTLrK1aO1KONSn3DR65zbrZCJBAJZ_nGA5doYfhQ'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('wallpapers'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Register'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Setting'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Contact us'),
            onTap: () {},
          ),
        ]),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              Container(
                height: 70,
                child: ListView.builder(
                  itemCount: catergories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      categoryName: catergories[index].categoryName,
                      imageUrl: catergories[index].imageUrl,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpaper: wallpaper, context: context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Category(
              categoryName: categoryName.toLowerCase(),
            ),
          ),
        );

        //search
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 100.0,
        child: Stack(
          children: <Widget>[
            //search

            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              color: Colors.black45,
            ),

            Center(
              child: Container(
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
