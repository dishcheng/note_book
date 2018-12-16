import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('aaa'),
        ),
        body: new Column(
          children: <Widget>[
//            Container(
//              color: Colors.black,
//              child: new Transform(
//                alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
//                transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
//                child: new Container(
//                  padding: const EdgeInsets.all(50.0),
//                  color: Colors.deepOrange,
//                  child: const Text('Apartment for rent!'),
//                ),
//              ),
//            ),
            Padding(
              padding: new EdgeInsets.all(20),
              //平移：Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子widget平移指定的距离
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                //默认原点为左上角，左移20像素，向上平移5像素
                child: Transform.translate(
                  offset: Offset(-20.0, -5.0),
                  child: Text("Hello world"),
                ),
              ),
            ),
            //Transform.rotate旋转
            Padding(
                padding: const EdgeInsets.all(20),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.rotate(
                    //旋转90度
                    angle: math.pi / 2,
                    child: Text("Hello world"),
                  ),
                )),

            //缩放 Transform.scale可以对子Widget进行缩小或放大，如：
            Padding(
                padding: const EdgeInsets.all(20),
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.scale(
                        scale: 1.5, //放大到1.5倍
                        child: Text("Hello world"))))
          ],
        ));
  }
}
