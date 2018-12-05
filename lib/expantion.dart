import 'package:flutter/material.dart';

class ExpantionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTitleDemo();
  }
}

/**
 * 当expansion tile 被展开时，我们可以看到background color
 * 会进行一个transition动画进行过渡
 *
 * 当一个list view中由多个expansion tile的时候
 * 需要给每一个expansion tile指定唯一的[PageStorageKey]？？todo::未解
 * 以保证在滑动的过程中，能够记住expansion tile的开关状态
 */
class ExpansionTitleDemo extends StatefulWidget {
  @override
  ExpansionTitleDemoState createState() => ExpansionTitleDemoState();
}

class ExpansionTitleDemoState extends State<ExpansionTitleDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: new Text('title'),
        ),
        body: ListView(
          children: <Widget>[
            new ExpansionTile(
              title: new Text('title'),
              initiallyExpanded: true, //最初的状态是否被展开
              trailing: new Icon(Icons.add), //修改左侧的三角箭头符号为+号
              children: <Widget>[
                ListTile(
                    title: Text('list tile'),
                    subtitle: Text('subtitle'),
                    onTap: () {
                      print('list tile');
                    }),
                ListTile(
                    title: Text('list tile'),
                    subtitle: Text('subtitle'),
                    onTap: () {
                      print('list tile');
                    }),
              ],
            ),
            new ExpansionTile(
              title: new Text('title'),
              children: <Widget>[
                ListTile(
                    title: Text('list tile'),
                    subtitle: Text('subtitle'),
                    onTap: () {
                      print('list tile');
                    }),
              ],
            ),
          ],
        ));
  }
}
