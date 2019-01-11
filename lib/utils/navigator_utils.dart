import 'package:flutter/material.dart';

///
/// Created by Maker on 2019/1/11.
/// Describe: 路由
///

class NavigatorUtils{
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///首页
  static showHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }
  
  
}