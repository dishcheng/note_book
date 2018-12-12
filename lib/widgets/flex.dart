import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlewWidget extends StatelessWidget {
  //flex为弹性系数，如果为0或null，
  // 则child是没有弹性的，即不会被扩伸占用的空间。
  // 如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('FlewWidget'),
        ),
        body: new Column(
          //默认子widget居左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flex(
              //Flex的两个子widget按1：2来占据水平空间
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      height: 20,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                      height: 20,
                    )),
              ],
            )
          ],
        ));
  }
}
