import 'package:flutter/material.dart';

//WillPopScope()会检测你有没有上一页，如果没有上一页就会直接退出app，如果有上一页就会不断的返回上一页
class WillPopDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomeWillPop();
  }
}

class HomeWillPop extends StatefulWidget {
  @override
  State createState() {
    return HomeWillPopState();
  }
}

class HomeWillPopState extends State<HomeWillPop> {
  //需要是Future<bool>型
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('确定要退出吗？'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    //实现原理，使用WillPopScope组件，它会检测到子组件的Navigation的pop事件，并拦截下来。
    //我们需要在它的onWillPop属性中返回一个新的组件（一般是一个Dialog）处理是否真的pop该页面。
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
            appBar: AppBar(
              title: Text('will pop demo'),
            ),
            body: ListView(
              children: <Widget>[
                new Center(
                  child: new RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Demo2()));
                    },
                    child: new Text('去第二页'),
                  ),
                ),
              ],
            )));
  }
}

class Demo2 extends StatefulWidget {
  @override
  State createState() {
    return Demo2State();
  }
}

class Demo2State extends State<Demo2> {
  //需要是Future<bool>型
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('确定要返回上一步吗？'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
        appBar: AppBar(
          title: new Text('will pop demo2'),
        ),
        body: new ListView(
          children: <Widget>[
            new Center(
              child: new RaisedButton(
                child: new Text('跳转home页面'),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new HomeWillPop()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
