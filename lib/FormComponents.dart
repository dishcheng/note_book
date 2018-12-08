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

  @override
  void initState() {
    super.initState();
    _load();
  }

  var RadioDefaultGroupValue = 1;
  var RadioValues = [1, 2, 3];

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

  //radio
  updateGroupStatus(GroupValue) {
    setState(() {
      RadioDefaultGroupValue = GroupValue;
    });
  }

  double SliderValue = 1.0;

  slideUpdateValue(SliderChangeValue) {
    print(SliderChangeValue.roundToDouble());
    setState(() {
      SliderValue = SliderChangeValue.roundToDouble();
    });
  }

  final TextEditingController _textController = new TextEditingController();

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
      body: new ListView(children: <Widget>[
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
        new Column(
          children: <Widget>[
            new Text('多个radio：'),
            new RadioListTile(
                title: Text('男'),
                selected:
                    RadioValues[0] == RadioDefaultGroupValue ? true : false,
                subtitle: Text('subtitle'),
                value: RadioValues[0],
                groupValue: RadioDefaultGroupValue,
                onChanged: (int e) => updateGroupStatus(e)),
            new RadioListTile(
                title: Text('女'),
                selected:
                    RadioValues[1] == RadioDefaultGroupValue ? true : false,
                subtitle: Text('subtitle'),
                value: RadioValues[1],
                groupValue: RadioDefaultGroupValue,
                onChanged: (int e) => updateGroupStatus(e)),
            new RadioListTile(
                title: Text('未知'),
                selected:
                    RadioValues[2] == RadioDefaultGroupValue ? true : false,
                subtitle: Text('subtitle'),
                value: RadioValues[2],
                groupValue: RadioDefaultGroupValue,
                onChanged: (int e) => updateGroupStatus(e)),
          ],
        ),
        new Slider(
            value: SliderValue,
            min: 1.0,
            //min需要大于0
            max: 100.0,
            divisions: SliderValue.toInt(),
            //刻度,不想出现刻度和气泡,删除这个属性就可以了
            activeColor: Colors.red,
            //滑块轨道中活动的部分的颜色。
            inactiveColor: Colors.blue,
            //滑块轨道的不活动部分的颜色
            label: '$SliderValue',
            //拖动滑块时候,在刻度上方气泡里面显示的进度值
//            onChanged:(double e)=>slideUpdateValue(e.roundToDouble()))//四舍五入
            onChanged: (double e) => slideUpdateValue(e)),
        new Padding(padding: const EdgeInsets.all(8.0)),
        new SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.deepOrangeAccent,
            activeTickMarkColor: Colors.white,
            inactiveTickMarkColor: Colors.white,
            inactiveTrackColor: Colors.black,
            valueIndicatorColor: Colors.blue,
            thumbColor: Colors.green,
            overlayColor: Colors.amber,
          ),
          child: new Container(
            margin: const EdgeInsets.all(10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text('0.0'),
                new Expanded(
                    child: new Slider(
                        onChanged: (double value) {
                          setState(() {
                            SliderValue = value;
                          });
                        },
                        divisions: 10,
                        //不想出现刻度和气泡,删除这个属性就可以了，自己实验
                        label: '$SliderValue',
                        value: SliderValue,
                        max: 100,
                        min: 1)),
                new Text('100.0'),
              ],
            ),
          ),
        ),
        new TextField(
          autofocus: true, //自动获取焦点
          controller: _textController,
          decoration: new InputDecoration(
            contentPadding: new EdgeInsets.all(15.0),
//              border: InputBorder.none
          ),
          onChanged: (String content) {
            print(content); //文本内容变化,会回调给我们
          },
        ),
        new Padding(padding: const EdgeInsets.all(8)),
        new Material(
          type: MaterialType.canvas,
          shape: new StadiumBorder(
              side: new BorderSide(
                  color: Colors.green, style: BorderStyle.solid)),
          child: new TextField(

            autofocus: true, //自动获取焦点
            controller: _textController,
            decoration: new InputDecoration(
                contentPadding: new EdgeInsets.all(15.0),
                border: InputBorder.none,
              hintText: '带形状的输入框',
            ),

            onChanged: (String content) {
              print(content); //文本内容变化,会回调给我们
            },
          ),
        )
      ]),
    );
  }
}
