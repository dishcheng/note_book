import 'package:flutter/material.dart';
import 'pages/airplay_screen.dart';
import 'pages/email_screen.dart';
import 'pages/home_screen.dart';
import 'pages/pages_screen.dart';

class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eachView = List();
    _eachView..add(HomeScreen())..add(EmailScreen());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _eachView[_index],
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return AirPlayScreen();
          }));
        },
//        tooltip: 'Increment',//长按提示
        child: new Icon(Icons.add),
      ), // T
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked, // his
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.near_me),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.edit_location),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
