import 'package:dio/dio.dart';
import 'dart:convert';
import '../utils/ApiUtils.dart';

//要查网络请求的日志可以使用过滤<net>
class Http {
  static const String GET = "get";
  static const String POST = "post";

//  static const String FORM = "form";

  //get请求
  static get(String url,
      {Map<dynamic, dynamic> params, Function errorCallBack}) async {
    return _request(Api.BASE_URL + url,
        method: GET, params: params, errorCallBack: errorCallBack);
  }

  //post请求
  static post(String url, {params, Function errorCallBack}) async {
    return _request(Api.BASE_URL + url,
        method: POST, params: params, errorCallBack: errorCallBack);
  }

//  //formData请求
//  static formData(String url,
//      {Map<String, String> params, Function errorCallBack}) async {
//    return _request(Api.BASE_URL + url,
//        method: FORM, params: params, errorCallBack: errorCallBack);
//  }

  //具体的还是要看返回数据的基本结构
  //公共代码部分
  static _request(String url,
      {String method,
      Map<dynamic, dynamic> params,
      Function errorCallBack}) async {
    print("<net> url :<" + method + ">" + url);
    print("url:$url");
    if (params != null && params.isNotEmpty) {
      print("<net> params :" + params.toString());
    }
    try {
      Response response;
      if (method == GET) {
        //组合GET请求的参数
        if (params != null && params.isNotEmpty) {
          StringBuffer sb = new StringBuffer("?");
          params.forEach((key, value) {
            sb.write("$key" + "=" + "$value" + "&");
          });
          String paramStr = sb.toString();
          paramStr = paramStr.substring(0, paramStr.length - 1);
          url += paramStr;
        }

        response = await Dio(new Options(
          connectTimeout: 15000, //15s
          receiveTimeout: 5000, //5s
          headers: {
          },
        )).get(url);
      } else {
        response = await Dio(new Options(
          connectTimeout: 15000, //15s
          receiveTimeout: 5000, //5s
          headers: {
          },
        )).post(url, data: params);
      }

      if (response.data is Map) {
        print('is_map');
        return response.data;
      } else {
        print('not_map');
        return jsonDecode(response.data);
      }
    } catch (exception) {
      //返回的状态只要不是2**,304的，全部都会进入到这里
//      statusCode = exception.response.statusCode;
//      if (statusCode == 401) {
//        //通知home页面用户未认证，跳转到login页面
//        eventBus.fire(new UnAuthenticate());
//      }
//      print('errorStatusCode$statusCode');
      _handError(errorCallBack, exception.toString());
    }
  }

  //处理异常
  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg :" + errorMsg);
  }
}
