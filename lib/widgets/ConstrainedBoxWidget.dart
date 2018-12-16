import 'package:flutter/material.dart';

class ConstrainedBoxWidget extends StatefulWidget {
  @override
  _ConstrainedBoxWidgetState createState() => _ConstrainedBoxWidgetState();
}

Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

Widget BlueBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.blue),
);

class _ConstrainedBoxWidgetState extends State<ConstrainedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('布局限制类容器ConstrainedBox'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0, //最小高度为50像素
                maxHeight: 70.0, //最大高度
                maxWidth: double.infinity, //最大宽度
              ),
              //虽然将Container的高度设置为5像素，但是最终却是50像素，这正是ConstrainedBox的最小高度限制生效了。
              child: Container(height: 5.0, child: redBox),
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: BlueBox,
            )
          ],
        ));
  }
}
