import 'package:redux/redux.dart';

enum AppActions { Increase, Decrease, Login, LoginSuccess, LogoutSuccess }

/// 这个类用来管理登录状态
class AuthState {
  bool isLogin; //是否登录
  String account; //用户名
  AuthState({this.isLogin: false, this.account});

  @override
  String toString() {
    return "{account:$account,isLogin:$isLogin}";
  }
}

/// 管理主页状态
class MainPageState {
  int counter;

  MainPageState({this.counter: 0});

  @override
  String toString() {
    return "{counter:$counter}";
  }
}

/// 定义所有action的基类
class Action {
  final AppActions type;

  Action({this.type});
}

/// 定义Login成功action
class LoginSuccessAction extends Action {
  final String account;

  LoginSuccessAction({this.account}) : super(type: AppActions.LoginSuccess);
}

/// 应用程序状态
class AppState {
  AuthState auth; //登录
  MainPageState main; //主页

  AppState({this.main, this.auth});

  @override
  String toString() {
    return "{auth:$auth,main:$main}";
  }
}

AppState mainReducer(AppState state, dynamic action) {
  print("state charge :$action ");
  if (AppActions.Increase == action) {
    state.main.counter += 1;
  }

  if (AppActions.Decrease == action) {
    state.main.counter -= 1;
  }

  if (AppActions.LogoutSuccess == action) {
    state.auth.isLogin = false;
    state.auth.account = null;
  }

  if (action is LoginSuccessAction) {
    state.auth.isLogin = true;
    state.auth.account = action.account;
  }

  print("state changed:$state");

  return state;
}

loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');

  next(action);
}

Store<AppState> store = new Store<AppState>(mainReducer,
    initialState: new AppState(
      main: new MainPageState(),
      auth: new AuthState(),
    ),
    middleware: [loggingMiddleware]);
