import 'dart:collection';

import 'package:flutter_max/http/Code.dart';
import 'package:flutter_max/http/ResultData.dart';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_max/common/config/config.dart';
import 'package:flutter_max/common/locale/locale_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

/**
 * Created by Maker on 2019/2/27.
 * Describe: 网络请求
 */

class Http{
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  static netFetch(url, params, Map<String, String> header, Options option, {noTip = false}) async {

    //没有网络
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip), false, Code.NETWORK_ERROR);
    }

    Map<String, String> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    //授权码
    if (optionParams["authorizationCode"] == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        optionParams["authorizationCode"] = authorizationCode;
      }
    }

    headers["Authorization"] = optionParams["authorizationCode"];

    if (option != null) {
      option.headers = headers;
    } else{
      option = Options(method: "get");
      option.headers = headers;
    }

    ///超时
    option.connectTimeout = 15000;

    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (Config.DEBUG) {
        print('请求异常: ' + e.toString());
        print('请求异常url: ' + url);
      }
      return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
    }

    if (Config.DEBUG) {
      print('请求url: ' + url);
      print('请求头: ' + option.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
      if (optionParams["authorizationCode"] != null) {
        print('authorizationCode: ' + optionParams["authorizationCode"]);
      }
    }

    try {
      if (option.contentType != null && option.contentType.primaryType == "text") {
        return new ResultData(response.data, true, Code.SUCCESS);
      } else {
        var responseJson = response.data;
        if (response.statusCode == 201 && responseJson["token"] != null) {
          optionParams["authorizationCode"] = 'token ' + responseJson["token"];
          await LocaleStorage.save(Config.TOKEN_KEY, optionParams["authorizationCode"]);
        }
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + url);
      return new ResultData(response.data, false, response.statusCode, headers: response.headers);
    }
    return new ResultData(Code.errorHandleFunction(response.statusCode, "", noTip), false, response.statusCode);
  }

  ///清除授权
  static clearAuthorization() {
    optionParams["authorizationCode"] = null;
    LocaleStorage.remove(Config.TOKEN_KEY);
  }

  ///获取授权token
  static getAuthorization() async {
    String token = await LocaleStorage.get(Config.TOKEN_KEY);
    if (token == null) {
      String basic = await LocaleStorage.get(Config.USER_BASIC_CODE);
      if (basic == null) {
        //提示输入账号密码
      } else {
        //通过 basic 去获取token，获取到设置，返回token
        return "Basic $basic";
      }
    } else {
      optionParams["authorizationCode"] = token;
      return token;
    }
  }

  // get请求的封装，传入的两个参数分别是请求URL和请求参数，请求参数以map的形式传入，会在方法体中自动拼接到URL后面
  static Future<String> get(String url, {Map<String, String> params}) async {
    if (params != null && params.isNotEmpty) {
      // 如果参数不为空，则将参数拼接到URL后面
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    http.Response res = await http.get(url);
    return res.body;
  }

  // post请求
  static Future<String> post(String url, {Map<String, String> params}) async {
    http.Response res = await http.post(url, body: params);
    return res.body;
  }

}