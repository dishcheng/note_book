import 'package:flutter/material.dart';
import 'dart:convert';
import 'utils/NetUtils.dart';
import 'utils/ApiUtils.dart';

class FormComponents extends StatefulWidget {
  @override
  State createState() {
    return _FormComponentsState();
  }
}

class _FormComponentsState extends State<FormComponents> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  List checkedListData = <String>[];
  List checkedList = [true, true, true, true];

  //加载数据
  Future _load() async {
    var a = {"shop_id": 1};
    print('触发');
    var ab =
        await Http.get(Api.visitorInfo, params: a, errorCallBack: (errorMsg) {
      print("error222:" + errorMsg);
    });
    print(ab);
    setState(() {
      checkedListData = ab['meta']['services'];
    });
    print(checkedListData);
  }

  List<Widget> a() {
    return [];
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  Widget checkBoxListItemBuild(text, value, index) {
    return new CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: new Text(text),
        value: value,
        onChanged: (bool) => updateCheckboxStatus(index, bool));
  }

  updateCheckboxStatus(int position, bool isCheck) {
    setState(() {
      checkedList[position] = isCheck;
//      checkedListData[position]['single_print'] = isCheck == true ? 1 : 0;
    });
  }

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Material(
//      child: new ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemCount: checkedListData.length,
//        itemBuilder: (context, i) {
//          print(checkedListData[i]);
//          return checkBoxListItemBuild(
//              checkedListData[i]['paper_type'],
//              checkedListData[i]['single_print'] == 1 ? true : false,
//              i); //把数据项塞入ListView中
//        },
//      ),
//    );
//  }

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
            Text('单个Checkbox：'),
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
            Text('单个radio：'),
            Radio(
                value: _checkboxSelected,
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
                groupValue: _checkboxSelected),
          ],
        ),
        new Column(
          children: <Widget>[
            new Text('多个checkbox：'),
            checkBoxListItemBuild('张三', checkedList[0], 0),
            checkBoxListItemBuild('李四', checkedList[1], 1),
            checkBoxListItemBuild('王五', checkedList[2], 2),
            checkBoxListItemBuild('赵六', checkedList[3], 3),
          ],
        ),
        new Row(
          children: <Widget>[
            new Text('多个radio：'),
          ],
        ),
      ]),
    );
  }
}
