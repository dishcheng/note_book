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
import 'parent_child_state_manage.dart';
import 'textStyle.dart';
import 'ButtonTypes.dart';
import 'image_and_icon.dart';
import 'FormComponents.dart';
import 'widgets/transform_widget.dart';
import 'widgets/row_and_column.dart';
import 'widgets/flex.dart';
import 'widgets/wrap.dart';
import 'widgets/stack.dart';
import 'widgets/ConstrainedBoxWidget.dart';
import 'widgets/DecoratedBoxWidget.dart';
import 'widgets/ContainerWidget.dart';
import 'gesture_detector.dart';
import 'websocekt_test.dart';
import 'redux_demo.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'utils/reduxUtils.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(new MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//        title: 'Flutter bottomNavigationBar',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        home: HomePageDemo());
//  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'RxDart Github Search',
        theme: new ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
        ),
        home: new HomePageDemo(),
      ),
    );
  }
//  @override
//  Widget build(BuildContext context) {
//    return new StoreProvider(
//        store: store,
//        child: new MaterialApp(
//            title: 'Flutter Demo',
//            theme: new ThemeData(
//              primarySwatch: Colors.blue,
//            ),
//            home: HomePageDemo()));
//  }
}

class HomePageDemo extends StatefulWidget {
  @override
  State createState() {
    return new HomePageDemoState();
  }
}

class HomePageDemoState extends State<HomePageDemo> {
  @override
  Widget build(BuildContext context) {
//    debugDumpApp();
    return new ListView(
      children: <Widget>[
        new ButtonItem(
            text: 'BottomNavigationBar底部导航，状态保持',
            className: new NavigationKeepAlive()),
        new ButtonItem(
            text: 'BottomAppBar底部导航', className: new BottomAppBarDemo()),
        new ButtonItem(text: '自定义路由样式', className: new FirstPage()),
        new ButtonItem(text: '高斯玻璃', className: new FrostedGlassDemo()),
        new ButtonItem(text: 'tab状态保持', className: new KeepAliveDemo()),
        new ButtonItem(
            text: '搜索框 todo::learning', className: new SearchBarDemo()),
        new ButtonItem(
            text: 'text自动聚焦、动作、聚焦下一个text', className: new TextFieldFocusDemo()),
        new ButtonItem(text: '九宫格模型', className: new NineWarp()),
        new ButtonItem(text: '标签demo', className: new LabelChilDemo()),
        new ButtonItem(text: 'exnpantion demo', className: new ExpantionDemo()),
        new ButtonItem(text: '渐变', className: new SilverDemo()),
        new ButtonItem(
            text: '返回上一页的提示，如果是home页面直接是退出登陆', className: new WillPopDemo()),
        new ButtonItem(
            text: '列表中滑动删除item', className: new SwipeToDissmissDemo()),
        new ButtonItem(text: '可拖拽组件', className: new DraggableDemo()),
        //flutter实战
        new ButtonItem(text: '父子组件混合状态管理', className: new ParentWidgetC()),
        new ButtonItem(text: '文本样式', className: new TextStyleManage()),
        new ButtonItem(text: '按钮类型', className: new ButtonTypes()),
        new ButtonItem(text: '图片和icon处理', className: new ImageAndIcons()),
        new ButtonItem(text: '表单组件', className: new FormComponents()),
        new ButtonItem(text: '变换组件', className: new TransformWidget()),
        new ButtonItem(text: 'widget组件/row', className: new RowWidget()),
        new ButtonItem(
            text: 'widget组件/column嵌套', className: new SpecialColumn()),
        new ButtonItem(
            text: 'widget组件/column嵌套2', className: new SpecialColumn2()),

        new ButtonItem(text: 'widget组件/flex', className: new FlewWidget()),
        new ButtonItem(text: 'widget组件/wrap', className: new WrapWidget()),
        new ButtonItem(text: 'widget组件/stack', className: new StackWidget()),
        new ButtonItem(
            text: '容器类widget组件/ConstrainedBox',
            className: new ConstrainedBoxWidget()),

        new ButtonItem(
            text: '容器类widget组件/装饰容器容器DecoratedBox',
            className: new DecoratedBoxWidget()),
        new ButtonItem(
            text: '容器类widget组件/container容器（组合widget）',
            className: new ContainerWidget()),

        new ButtonItem(text: '手势识别', className: new GestureDetect()),
        new ButtonItem(text: 'websocket测试', className: new WebSocketRoute()),
        new ButtonItem(
          text: 'redux状态管理',
          className: new StoreConnector<AppState, AppState>(
              builder: (BuildContext context, AppState state) {
            print("isLogin:${state.auth.isLogin}");
            return new ReduxDemo();
          }, converter: (Store<AppState> store) {
            return store.state;
          }),
        ),
      ],
    );
  }
}

class ButtonItem extends StatefulWidget {
  final text;
  final className;

  const ButtonItem({Key key, this.text, this.className}) : super(key: key);

  @override
  _ButtonItemState createState() => _ButtonItemState();
}

class _ButtonItemState extends State<ButtonItem> {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => widget.className));
      },
      child: new Text(widget.text),
    );
  }
}
