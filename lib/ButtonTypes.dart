import 'package:flutter/material.dart';

class ButtonTypes extends StatefulWidget {
  @override
  State createState() {
    return _ButtonTypesState();
  }
}

class _ButtonTypesState extends State<ButtonTypes> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('按钮类型'),
      ),
      body: new ListView(
        children: <Widget>[
          new RaisedButton(
            onPressed: _pressed_down,
            child: Text('RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大'),
            textColor: Colors.red,
            //字体颜色
            disabledTextColor: Colors.amberAccent,
            ////如果onPressed为null,即禁用状态的颜色
            highlightColor: Colors.blueGrey,
            //按钮按下时的背景颜色
            splashColor: Colors.green,
            //点击时，水波动画中水波的颜色
            colorBrightness: Brightness.dark,
            //按钮主题，默认是浅色主题
            color: Colors.grey,
            //按钮背景颜色
            padding: const EdgeInsets.all(28.0),
            //按钮内部填充的padding
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            //按钮外形
            elevation: 2.0,
            //正常状态下的阴影
            highlightElevation: 32.0,
            //按下时的阴影
            disabledElevation: 0,
            //禁用时的阴影
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          new FlatButton(
              onPressed: _pressed_down,
              child: new Text('FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色')),
          new Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          new OutlineButton(
              onPressed: _pressed_down,
              child: new Text(
                  'OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)')),
          new Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          new IconButton(icon: Icon(Icons.print), onPressed: _pressed_down)
        ],
      ),
    );
  }

  _pressed_down() {
    print('aaaa');
  }
}
