import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('StackWidget'),
        ),
        body: //通过ConstrainedBox来确保Stack占满屏幕
            ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            //由于第二个子widget没有定位，所以fit属性会对它起作用，就会占满Stack。有Stack子元素是堆叠的，所以第一个子Widget被第二个遮住了，而第三个在最上层，所以可以正常显示。
            fit: StackFit.expand, //未定位widget占满Stack整个空间
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Container(
                child:
                    Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              )
            ],
          ),
        ));
  }
}
