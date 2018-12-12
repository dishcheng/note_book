import 'package:flutter/material.dart';

//http://localhost:4000/chapter4/row_and_column.html
class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('row'),
        ),
        body: new Column(
          //默认子widget居左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              //排除Column默认的干扰，居中对齐
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('MainAxisAlignment.center'),
              ],
            ),
            Row(
              //居右对齐
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('MainAxisAlignment.end'),
              ],
            ),
            Row(
              //由于mainAxisSize值为MainAxisSize.min，
              // 所以对齐是无意义的，
              // 所以会从左往右显示
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('MainAxisSize.min;MainAxisAlignment.end'),
              ],
            ),
            Row(
              //设置textDirection值为TextDirection.rtl，
              //所以子widget会从右向左的顺序排列
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text('TextDirection.rtl'),
                Text('第一个text'),
                Text('第二个text'),
              ],
            ),
            Row(
              //底对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              //从低向顶排列
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text('我小一些，'),
                Text(
                  '我大一些',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            )
          ],
        ));
  }
}

//如果Row里面嵌套Row，或者Column里面再嵌套Column，
// 那么只有对最外面的Row或Column会占用尽可能大的空间，
// 里面Row或Column所占用的空间为实际大小，
// 下面以Column为例说明：
class SpecialColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text('column'),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                  children: <Widget>[
                    Text("只有对最外面的Row或Column"),
                    Text("会占用尽可能大的空间 "),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialColumn2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text('column'),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                    children: <Widget>[
                      Text("如果要让里面的Colum占满外部Colum"),
                      Text("可以使用Expanded widget "),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
