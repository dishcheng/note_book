import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'utils/reduxUtils.dart';
import 'nine_warp.dart';

class ReduxDemo extends StatefulWidget {
//  final count;
//  ReduxDemo({Key key, @required this.count}) : super(key: key);
  ReduxDemo({Key key}) : super(key: key);

  @override
  ReduxDemoState createState() => ReduxDemoState();
}

class ReduxDemoState extends State<ReduxDemo> {
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
//            Center(
//              child: Text(
//                widget.count.toString(),
//                style: TextStyle(color: Colors.amber, fontSize: 30),
//              ),
//            ),
            new StoreConnector<AppState, int>(
              converter: (store) => store.state.main.counter,
              builder: (context, count) {
                return Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        count.toString(),
                        style: TextStyle(color: Colors.blue),
                      ),
                    ));
              },
            ),
            new StoreConnector<AppState, int>(
              converter: (store) => store.state.main.counter,
              builder: (BuildContext context, int) {
                return Center(
                    child: RaisedButton(
                  onPressed: null,
                  child: Text('sss'),
                ));
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 100),
            ),
            new StoreConnector<AppState, VoidCallback>(
                builder: (BuildContext context, VoidCallback callback) {
              return new RaisedButton(
                onPressed: callback,
                child: Icon(Icons.add),
              );
            }, converter: (Store<AppState> store) {
              return () => store.dispatch(AppActions.Increase);
            }),
            Container(
              child: new StoreConnector<AppState, VoidCallback>(
                  builder: (BuildContext context, VoidCallback callback) {
                return new RaisedButton(
                  onPressed: callback,
                  child: Icon(Icons.remove),
                );
              }, converter: (Store<AppState> store) {
                return () => store.dispatch(AppActions.Decrease);
              }),
            ),
            new RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ReduxDemo2()));
              },
              child: Text('跳转子页面，查看点击数'),
            )
          ],
        ),
      ),
    );
  }
}

class ReduxDemo2 extends StatelessWidget {
  ReduxDemo2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoreConnector<AppState, int>(
        converter: (store) => store.state.main.counter,
        builder: (context, count) {
          return Center(
              child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              count.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ));
        },
      ),
    );
  }
}
