/**
 * 实现原理：
 * 使用FocusNode获取当前textField焦点
 * 在TextNode的textInputAction属性中选择键盘action（next/down）
 * 对于最后一个之前的TextField：在onSubmitted属性中解除当前focus状态
 * 再聚焦下一个FocusNode:FocusScope.of(context).requestFocus( nextFocusNode );
 * 对于最后一个TextField,直接解除focus并提交表单
 */
import 'package:flutter/material.dart';

class TextFieldFocusDemo extends StatefulWidget {
  @override
  State createState() => TextFieldFocusDemoState();
}

class TextFieldFocusDemoState extends State<TextFieldFocusDemo> {
  TextEditingController _nameController, _pwController;
  FocusNode _nameFocus, _pwFocus;

  @override
  void initState() {
    _nameController = TextEditingController();
    _pwController = TextEditingController();
    _nameFocus = FocusNode();
    _pwFocus = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 80.0),
            Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 32.0),
              ),
            ),
            const SizedBox(height: 80.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  focusNode: _nameFocus,
                  //这个聚焦位置的名称
                  controller: _nameController,
                  autofocus: true,
                  //自动聚焦
                  obscureText: false,
                  //todo::不太理解这个属性的作用
                  textInputAction: TextInputAction.next,
                  //键盘右下角会有一个回车，下一步
                  onSubmitted: (input) {
                    _nameFocus.unfocus(); //取消聚焦
                    FocusScope.of(context).requestFocus(_pwFocus); //下一个点
                  },
                  decoration: InputDecoration(
                    labelText: "name",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  focusNode: _pwFocus,
                  controller: _pwController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  //键盘右下角会有一个勾勾
                  onSubmitted: (input) {
                    _pwFocus.unfocus();
                  },
                  decoration: InputDecoration(
                    labelText: "password",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            new Center(
                child: RaisedButton(
              onPressed: () {},
              child: new Text(
                'login',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 30,
                  height: 1,
                ),
              ),
              color: Colors.white,
            ))
          ],
        ),
      ),
    );
  }
}
