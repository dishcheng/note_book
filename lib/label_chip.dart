import 'package:flutter/material.dart';

class LabelChilDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LabelChip();
  }
}

class LabelChip extends StatefulWidget {
  @override
  _LabelChipState createState() => _LabelChipState();
}

class _LabelChipState extends State<LabelChip> {
  bool _isSelected = false;
  bool _isSelected2 = false;

  String actionChip = '动作chip';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('chip demo'),
        ),
        body: ListView(
          children: <Widget>[
            Chip(
              label: Text('最简单的标签'),
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('01'),
              ),
              onDeleted: () {
                print('handle_delete');
              },
            ),
            InputChip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),
              label: Text('InputChip'),
              onPressed: () {
                print('I am the one thing in life.');
              },
              onDeleted: () {},
            ),
            //可筛选
            // * filter chip在被选中时会出来一个勾勾
            // * 有两点需要注意
            // * selected接受一个bool，代表当前是否被选中
            // * onSelected方法会自动传入一个bool，从true开始，true->false->true交替
            // */
            FilterChip(
              label: Text('可筛选'),
              selected: _isSelected,
              onSelected: (isSelected) {
                setState(() {
                  _isSelected = isSelected;
                });
              },
              selectedColor: Colors.blue.shade400,
            ),

            ChoiceChip(
              label: Text(
                'choice chip',
                style: TextStyle(color: Colors.black),
              ),
              selected: _isSelected2,
              onSelected: (isSelected2) {
                setState(() {
                  _isSelected2 = isSelected2;
                });
              },
              selectedColor: Colors.blue.shade400,
            ),

            //action chip 主要是在chip的基础上提供了一个onPress方法
            // * 能够触发一些动作
            ActionChip(
                label: Text(actionChip),
                onPressed: () {
                  setState(() {
                    print(this.actionChip == '动作chip');
                    this.actionChip == '动作chip'
                        ? this.actionChip = '执行动作chip后'
                        : this.actionChip = '动作chip';
                  });
                }),
          ],
        ));
  }
}
