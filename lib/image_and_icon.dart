import 'package:flutter/material.dart';

class ImageAndIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: ListView(
        children: <Widget>[
          Image.asset(
            'images/alipay_logo.png',
            height: 20,
          ),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 1,
            //图片的宽
            height: 200,
            //图片高度
            color: Colors.grey,
            //图片的混合色值
            colorBlendMode: BlendMode.difference,
            //混合模式，配合color属性
//            http://localhost:4000/chapter3/img_and_icon.html
//fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：
//fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
//cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
//contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
//fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
//fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
//none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
            //缩放模式
            alignment: Alignment.bottomLeft,
            //对齐方式
            repeat: ImageRepeat.repeatX, //重复方式
          ),

          //使用自定义图标
          //http://iconfont.cn/help/detail?helptype=code&spm=a313x.7781069.1998910419.13.UZMhYl
          //参照安卓使用方法，将对应ttf文件放到fonts目录，并且在yaml文件中导入，在demo html页面中找到实体字符，如：&#xeb62
          //将&#改为0，变成0xeb62,参考MyIcons类；；；；注意：yaml文件修改后需要重新build，否则无法生效
          Icon(
            MyIcons.bool,
            color: Colors.green,
          ),
          Icon(
            MyIcons.wechat,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class MyIcons {
  // fork 图标
  static const IconData bool =
      const IconData(0xeb62, fontFamily: 'myIcon', matchTextDirection: true);

  // 微信图标
  static const IconData wechat =
      const IconData(0xeb63, fontFamily: 'myIcon', matchTextDirection: true);
}
