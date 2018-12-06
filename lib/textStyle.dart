import 'package:flutter/material.dart';

class TextStyleManage extends StatefulWidget {
  @override
  State createState() {
    return _TextStyleManageState();
  }
}

class _TextStyleManageState extends State<TextStyleManage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('文本样式'),
      ),
      body: new ListView(
        children: <Widget>[
          new Text('最简单的文本'),
          new Text('居中文本' * 4, textAlign: TextAlign.center),
          //只有Text宽度大于文本内容长度时指定此属性才有意义
          new Text(
            '很多字的文本' * 100,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            //截断方式：ellipsis：超出宽度时用...代替 ;   clip:自动折行（默认值）  ;fade:
            maxLines: 2, //最多多少行
          ),
          new Text(
            '文本样式',
            style: TextStyle(
//                color: Colors.blue,
                //文本颜色
                fontSize: 30,
                //字体大小
                fontWeight: FontWeight.w500,
                //加粗方式
                fontStyle: FontStyle.italic,
                //斜体italic，默认normal
                letterSpacing: 3,
                //字间距
                wordSpacing: 0.1,
                //不详
                textBaseline: TextBaseline.ideographic,
                //不详
                height: 2,
                //高度占比，础值为1
                foreground: Paint()..color = Colors.red,
                //文本的前景，与color属性冲突，无法同时使用
//                background: Paint()..color = Colors.green,
                //字体背景
//                shadows:应该是阴影属性，但是还不会用
                decoration: TextDecoration.underline,
                //decoration下划线类型：默认为none，underline(下划线)，lineThrough（中划线）,overline(上划线)，单独设置无用，需要配合decorationColor
                decorationColor: Colors.orange,
                //划线颜色
                decorationStyle: TextDecorationStyle.wavy
                //划线样式 ：solid(实线默认值)， dashed（_ _ _ _），dotted(. . . . . .),double(双下划线)，wavy(波浪线)
                ),
            //
          ),
        ],
      ),
    );
  }
}
