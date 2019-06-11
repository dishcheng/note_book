import 'package:dio/dio.dart';
import 'dart:convert';
import '../utils/ApiUtils.dart';

import 'HandleStorage.dart';
//import '../utils/EventUtils.dart';
import 'package:flutter/material.dart';
//import '../widget/toast.dart';

//要查网络请求的日志可以使用过滤<net>
class Http {
  static const String GET = "get";
  static const String POST = "post";
  static const String DELETE = "delete";

  //提示错误
  static toastError({BuildContext context, Map res}) {
    if (context != null) {
//      if (res['result'] != 200) {
//        if (res.containsKey('status_code') && res['status_code'] == 500) {
//          //这里肯定是500服务器错误
//          AlertToast(context, "服务器错误：${res['message']}");
//        } else {
//          AlertToast(context, res['message']);
//        }
//      }
    }
  }

  //get请求
  static get(String url,
      {Map<dynamic, dynamic> params,
      Function errorCallBack,
      BuildContext context}) async {
    var res = await _request(url,
        method: GET, params: params, errorCallBack: errorCallBack);
    toastError(context: context, res: res);
    return res;
  }

  //post请求
  static post(String url,
      {params, Function errorCallBack, BuildContext context}) async {
    var res = await _request(url,
        method: POST, params: params, errorCallBack: errorCallBack);
    toastError(context: context, res: res);
    return res;
  }

  //delete请求
  static delete(String url,
      {params, Function errorCallBack, BuildContext context}) async {
    var res = await _request(url,
        method: DELETE, params: params, errorCallBack: errorCallBack);
    toastError(context: context, res: res);
    return res;
  }

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
      Map<String, dynamic> header = {};
      var token = await getToken();
      if (token != '') {
        header = {'Authorization': token};
      }
      debugPrint(Api.BASE_URL);
      print('token:' + header.toString());

      Response response;

      var host_with_url = Api.BASE_URL + url;
      var option = new BaseOptions(
          connectTimeout: 15000,
          //15s
          receiveTimeout: 5000,
          //5
          headers: header);

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
          host_with_url = Api.BASE_URL + url;
        }
        response = await Dio(option).get(host_with_url);
      } else if (method == POST) {
        response = await Dio(option).post(host_with_url, data: (params));
      } else if (method == DELETE) {
        response = await Dio(option).delete(host_with_url, data: (params));
      }

      //无痛刷新，laravel.refresh.token中间件
      var res_header = response.headers;
      if (res_header.value('Authorization') != null) {
        //相应头部如果有Authorization，将token替换掉
        saveToken(res_header.value('Authorization').toString());
      }

      if (response.data is Map) {
        print('is_map');
        print(response.data.toString());
        return response.data;
      } else {
        print('not_map');
        print(jsonDecode(response.data));
        return jsonDecode(response.data);
      }
    } on DioError catch (exception) {
      var message = '';
      switch (exception.type) {
        case DioErrorType.DEFAULT:
          message = '请求失败，请检查网络';
          break;

        case DioErrorType.CONNECT_TIMEOUT:
          message = '服务器连接超时';
          break;

        case DioErrorType.RESPONSE:
          //服务器返回的状态码
          print(exception.message);
          //返回的状态只要不是2**,304的，全部都会进入到这里
//          var statusCode = exception.response.statusCode;
//          if (statusCode == 401) {
//            //通知home页面用户未认证，跳转到login页面
//            eventBus.fire(new UnAuthenticate());
//          }
          _handError(errorCallBack, exception.response.data.toString());

          return exception.response.data;
          break;

        case DioErrorType.RECEIVE_TIMEOUT:
          message = '服务器返回超时';
          break;

        case DioErrorType.CANCEL:
          message = '请求已被取消';
          break;
        case DioErrorType.SEND_TIMEOUT:
          message = '请求发送超时';
          break;
      }
      Map params = {'result': 400, 'message': message};
      return params;
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
