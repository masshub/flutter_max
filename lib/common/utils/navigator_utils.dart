import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_max/page/demo/gridview/girdview_extend_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_builder_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_null_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_count_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_custom_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_list_demo.dart';
import 'package:flutter_max/page/demo/list/listview_builder_demo.dart';
import 'package:flutter_max/page/demo/list/listview_horizontal_demo.dart';
import 'package:flutter_max/page/demo/list/listview_list_demo.dart';
import 'package:flutter_max/page/demo/list/listview_vertical_demo.dart';
import 'package:flutter_max/page/home/home_page.dart';
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

  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  /// cupertino格式路由跳转
//  static NavigatorRouter(BuildContext context, Widget widget) {
//    return Navigator.push(
//        context, new CupertinoPageRoute(builder: (context) => widget));
//  }

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

  /***************** GridView ********************/
  static showGridViewDemoList(BuildContext context) {
    return NavigatorRouter(context, GridViewList());
  }

  static showGridViews(BuildContext context) {
    return NavigatorRouter(context, GridViews());
  }

  static showGridViewExtent(BuildContext context) {
    return NavigatorRouter(context, GridViewExtent());
  }
  static showGridViewCount(BuildContext context) {
    return NavigatorRouter(context, GridViewCount());
  }

  static showGridViewCustom(BuildContext context) {
    return NavigatorRouter(context, GridViewCustom());
  }

  static showGridViewBuilder(BuildContext context) {
    return NavigatorRouter(context, GridViewBuilder());
  }

  /******************** ListView *******************************/

  static showListViewList(BuildContext context) {
    return NavigatorRouter(context, ListViewList());
  }

  static showListViewVertical(BuildContext context) {
    return NavigatorRouter(context, ListViewVertical());
  }
  static showListViewHorizontal(BuildContext context) {
    return NavigatorRouter(context, ListViewHorizontal());
  }

  static showListViewBuilder(BuildContext context) {
    return NavigatorRouter(context, ListViewBuilder());
  }


}
