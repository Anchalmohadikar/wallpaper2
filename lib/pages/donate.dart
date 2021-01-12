import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(fit: StackFit.expand, children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(
              10.0,
            ),
            child: Text(
              'Comming soon',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 30.0,
              ),
            ),
          ),
        ]));
  }
}
