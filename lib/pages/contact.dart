import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
              alignment: Alignment.center,
              padding: EdgeInsets.all(
                10.0,
              ),
              child: Text(
                'Contact us',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 30.0,
                ),
              ),
            ),

            ],
            )
        ],
    ),
      
    );
  }
}