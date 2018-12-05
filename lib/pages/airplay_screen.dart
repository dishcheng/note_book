import 'package:flutter/material.dart';

class AirPlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AirPlay'),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          new Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          new Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          new Container(
            height: 200,
            width: 200,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
