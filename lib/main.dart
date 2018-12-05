import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';
import 'navigation_keep_alive.dart';
import 'bottom_app_bar.dart';
import 'pages/customer_router_page.dart';
import 'frosted_glass_demo.dart';
import 'tab_keep_alive_demo.dart';
import 'serach_bar_demo.dart';
import 'text_field_focus_demo.dart';
import 'nine_warp.dart';
import 'label_chip.dart';
import 'expantion.dart';
import 'silver.dart';
import 'will_pop_demo.dart';
import 'dismissble.dart';
import 'draggable_demo.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter bottomNavigationBar',
//      theme: new ThemeData.,
//      home: BottomNavigationWidget(),//BottomNavigationBar底部导航
//      home: NavigationKeepAlive(),//BottomNavigationBar底部导航
//      home: BottomAppBarDemo(),//BottomAppBar底部导航
//      home: new FirstPage(), //自定义路由样式
//      home: new FrostedGlassDemo(),//高斯玻璃
//      home: new KeepAliveDemo(), //tab状态保持
//      home: new SearchBarDemo(), //搜索框 todo::learning
//      home: new TextFieldFocusDemo(),//text自动聚焦、动作、聚焦下一个text
//      home: new NineWarp(), //九宫格模型
//      home: new LabelChilDemo(), //标签demo
//    home: ExpantionDemo(),//exnpantion demo
//    home: new SilverDemo(),//不知道什么鬼
//    home: new SilverDemo(),//不知道什么鬼
//      home: new WillPopDemo(), //返回上一页的提示，如果是home页面直接是退出登陆
//      home: new SwipeToDissmissDemo(), //列表中滑动删除item
      home: DraggableDemo(),
    );
  }
}
