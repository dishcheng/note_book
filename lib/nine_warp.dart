import 'package:flutter/material.dart';

//上传需要引入的
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
//  此外需要加入下面四行代码到android/app/src/main/AndroidManifest.xml
//<uses-permission android:name="android.permission.CAMERA" />
//<uses-permission android:name="android.permission.FLASHLIGHT" />
//<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
//<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

class NineWarp extends StatefulWidget {
  @override
  _NineWarpState createState() => _NineWarpState();
}

class _NineWarpState extends State<NineWarp> {
  List<Widget> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化的时候先添加一个button按钮，children不能为null
    list = List<Widget>()..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap(
              children: list,
              spacing: 5.0, //间距
              crossAxisAlignment: WrapCrossAlignment.center,
            ),
          ),
        ),
      ),
    );
  }

  Future getImage() async {
//    var image = await ImagePicker.pickImage(source: ImageSource.camera);//获取拍照的照片
    var image =
        await ImagePicker.pickImage(source: ImageSource.gallery); //获取相册照片

    setState(() {
      list.insert(list.length - 1, buildPhoto(image));
//      _image = image;
    });
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (list.length < 9) {
          getImage();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100.0,
        height: 100.0,
//        color: Colors.amber,
        child: Center(
          child: Image.file(image),
        ),
      ),
    );
  }
}
