import 'package:flutter/material.dart';

class KeepAliveDemo extends StatefulWidget {
  @override
  _KeepAliveDemoState createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
        title: Text('Keep Alive Demo'),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          ThisHomePage(
            title: 'Keep Alive demo',
          ),
          ThisHomePage(
            title: 'Keep Alive demo',
          ),
          ThisHomePage(
            title: 'Keep Alive demo',
          ),
        ],
      ),
    );
  }
}

//页面
class ThisHomePage extends StatefulWidget {
  final String title;

  ThisHomePage({Key key, this.title}) : super(key: key);

  @override
  ThisHomePageState createState() => ThisHomePageState();
}

// * 实现原理，使用AutomaticKeepAliveClientMixin，并重写wantKeepAlive方法，让状态不被回收掉。
class ThisHomePageState extends State<ThisHomePage>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
