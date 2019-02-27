import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_max/page/home_page.dart';
import 'package:flutter_max/page/login_page.dart';
import 'package:flutter_max/widget/max_web_view.dart';

///
/// Created by Maker on 2019/2/26.
/// Describe: 路由
///

class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  /// cupertino格式路由跳转
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(
        context, new CupertinoPageRoute(builder: (context) => widget));
  }

  /// home
  static showHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.mName);
  }

  /// 登陆页
  static showLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, Login.mName);
  }

  /// webview
  static Future showWebView(BuildContext context,String url,String title) {
    return NavigatorRouter(context, MaxWebView(url,title));

  }



}
