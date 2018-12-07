import 'package:flutter/material.dart';

class FormComponents extends StatefulWidget {
  @override
  State createState() {
    return _FormComponentsState();
  }
}

class _FormComponentsState extends State<FormComponents> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('表单组件'),
      ),
      body: new Column(children: <Widget>[
        new Row(
          children: <Widget>[
            Text('switch：'),
            Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Switch(
              //目前Switch只能定义宽度，高度也是固定
              value: _switchSelected,
              activeColor: Colors.green,
              //当值为true时的圆的颜色，如果不设置activeTrackColor属性，则影响activeTrackColor属性
              activeTrackColor: Colors.blue,
              //当值为true时的颜色，滑动范围内的颜色（不包括圆），如果不设置会比activeColor低几个度的颜色
              inactiveThumbColor: Colors.amber,
              //当值为false时的圆的颜色
              inactiveTrackColor: Colors.red,
              //当值为false时的滑动范围的颜色
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
          ],
        ),
        new Row(
          children: <Widget>[
            Text('Checkbox：'),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              tristate: true,
              //表示是否为三态，其默认值为false ，这时Checkbox有两种状态即“选中”和“不选中”，对应的value值为true和false ；
              // 如果其值为true时，value的值会增加一个状态null
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            ),
          ],
        ),
        new Row(
          children: <Widget>[
            Text('radio：'),
            Radio(
                value: _checkboxSelected,
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = !_checkboxSelected;
                  });
                },
                groupValue: _checkboxSelected),
          ],
        ),
      ]),
    );
  }

  _pressed_down() {
    print('aaaa');
  }
}
