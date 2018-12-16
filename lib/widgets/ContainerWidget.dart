import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('container容器（组合widget）'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50.0, left: 120.0),
          //容器外补白
          constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
          //卡片大小
          decoration: BoxDecoration(
              //背景装饰
              gradient: RadialGradient(
                  //背景径向渐变
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.topLeft,
                  radius: .98),
              boxShadow: [
                //卡片阴影
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ]),
          transform: Matrix4.rotationZ(.2),
          //卡片倾斜变换
          alignment: Alignment.center,
          //卡片内文字居中
          child: Text(
            //卡片文字
            "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ));
  }
}
