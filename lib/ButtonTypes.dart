import 'package:flutter/material.dart';

class ButtonTypes extends StatefulWidget {
  @override
  State createState() {
    return _ButtonTypesState();
  }
}

class _ButtonTypesState extends State<ButtonTypes> {
  //下拉菜单item点击之后获取到的值
  var selectItemValue;

  List<DropdownMenuItem> generateItemList() {
    List<DropdownMenuItem> items = new List();
    DropdownMenuItem item1 =
        new DropdownMenuItem(value: '张三1', child: new Text('张三'));
    DropdownMenuItem item2 =
        new DropdownMenuItem(value: '李四2', child: new Text('李四'));
    DropdownMenuItem item3 =
        new DropdownMenuItem(value: '王二3', child: new Text('王二'));
    DropdownMenuItem item4 =
        new DropdownMenuItem(value: '麻子4', child: new Text('麻子'));
    items.add(item1);
    items.add(item2);
    items.add(item3);
    items.add(item4);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('按钮类型'),
      ),
      body: new Column(
        children: <Widget>[
//          new RaisedButton(
//            onPressed: _pressed_down,
//            child: Text('RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大'),
//            textColor: Colors.red,
//            //按钮文字颜色
//            disabledTextColor: Colors.amberAccent,
//            ////如果onPressed为null,即禁用状态的颜色
//            highlightColor: Colors.blueGrey,
//            //按钮按下时的背景颜色
//            splashColor: Colors.green,
//            //点击时，水波动画中水波的颜色
//            colorBrightness: Brightness.dark,
//            //按钮主题，默认是浅色主题
//            color: Colors.grey,
//            //按钮背景颜色，按钮颜色
//            padding: const EdgeInsets.all(28.0),
//            //按钮内部填充的padding
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(20.0)),
//            //按钮外形
//            elevation: 2.0,
//            //正常状态下的阴影
//            highlightElevation: 32.0,
//            //按下时的阴影
//            disabledElevation: 0,
//            //禁用时的阴影
//          ),
//          new Padding(
//            padding: const EdgeInsets.all(8.0),
//          ),
//          new FlatButton(
//              onPressed: _pressed_down,
//              child: new Text('FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色')),
//          new Padding(
//            padding: const EdgeInsets.all(8.0),
//          ),
//          new OutlineButton(
//              onPressed: _pressed_down,
//              child: new Text(
//                  'OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)')),
//          new Padding(
//            padding: const EdgeInsets.all(8.0),
//          ),
//          new IconButton(icon: Icon(Icons.print), onPressed: _pressed_down),
//          new DropdownButtonHideUnderline(
//            child: new DropdownButton(
//              hint: new Text('下拉菜单选择一个人名'),
//              //设置这个value之后,选中对应位置的item，
//              //再次呼出下拉菜单，会自动定位item位置在当前按钮显示的位置处
//              value: selectItemValue,
//              items: generateItemList(),
//              onChanged: (T) {
//                print(T); //T的值是DropdownMenuItem.value的值
//                setState(() {
//                  selectItemValue = T;
//                });
//              },
//            ),
//          ),
//          new Padding(padding: const EdgeInsets.all(8)),
//          //悬浮按钮
//          new FloatingActionButton(
//            onPressed: () {
//              print('button click');
//            },
//            foregroundColor: Colors.white,
//            //Text文本或者图片(icon或者image)默认的颜色,前提是Text或者icon不设置颜色的情况下才使用
//            backgroundColor: Colors.amber,
//            //按钮背景颜色
//            shape: const CircleBorder(),//const StadiumBorder()
//            //圆形的悬浮按钮
//            child: new Icon(Icons.add),
//          ),
          new FloatingActionButton.extended(
            onPressed: () {
              print('button click');
            },
            foregroundColor: Colors.white,
            backgroundColor: Colors.amber,
            //如果不手动设置icon和text颜色,则默认使用foregroundColor颜色
            icon: new Icon(Icons.flag,color: Colors.red,),
            label: new Text('FloatingActionButton.extended', maxLines: 1),
          )
        ],
      ),
    );
  }

  _pressed_down() {
    print('aaaa');
  }
}
