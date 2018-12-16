import 'package:flutter/material.dart';

class GestureDetect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetectA();
  }
}

class GestureDetectA extends StatefulWidget {
  @override
  _GestureDetectAState createState() => _GestureDetectAState();
}

class _GestureDetectAState extends State<GestureDetectA> {
  String _operation = "No Gesture detected!"; //保存事件名

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('手势识别'),
        ),
        body: Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200.0,
              height: 100.0,
              child: Text(
                _operation,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => updateText("点击"), //点击
            onDoubleTap: () => updateText("双击"), //双击
            onLongPress: () => updateText("长按"), //长按
          ),
        ));
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
