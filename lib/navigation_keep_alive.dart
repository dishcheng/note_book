import 'package:flutter/material.dart';
import 'pages/airplay_screen.dart';
import 'pages/email_screen.dart';
import 'pages/home_screen.dart';
import 'pages/pages_screen.dart';

class NavigationKeepAlive extends StatefulWidget {
  @override
  _NavigationKeepAliveState createState() => _NavigationKeepAliveState();
}

class _NavigationKeepAliveState extends State<NavigationKeepAlive>
    with SingleTickerProviderStateMixin {

  final _bottomNavigationColor = Colors.blue;
  final _bottomNavigationSelectColor = Colors.red;
  int _currentIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomeScreen(),
          EmailScreen(),
          AirPlayScreen(),
          PagesScreen()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
//          onTap: (index)=> _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _currentIndex==0 ?_bottomNavigationSelectColor:_bottomNavigationColor,
              ),
              title: Text(
                'HOME',
                style: TextStyle(color: _currentIndex==0 ?_bottomNavigationSelectColor:_bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _currentIndex==1 ?_bottomNavigationSelectColor:_bottomNavigationColor,
              ),
              title: Text(
                'Email',
                style: TextStyle(color: _currentIndex==1 ?_bottomNavigationSelectColor:_bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _currentIndex==2 ?_bottomNavigationSelectColor:_bottomNavigationColor,
              ),
              title: Text(
                'PAGES',
                style: TextStyle(color: _currentIndex==2 ?_bottomNavigationSelectColor:_bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _currentIndex==3 ?_bottomNavigationSelectColor:_bottomNavigationColor,
              ),
              title: Text(
                'AIRPLAY',
                style: TextStyle(color: _currentIndex==3 ?_bottomNavigationSelectColor:_bottomNavigationColor),
              )),
        ],
      ),
    );
  }
}