import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_max/page/demo/animation/animation_demo.dart';
import 'package:flutter_max/page/demo/basic/basic_demo.dart';
import 'package:flutter_max/page/demo/basic/column_demo.dart';
import 'package:flutter_max/page/demo/basic/container_demo.dart';
import 'package:flutter_max/page/demo/basic/row_demo.dart';
import 'package:flutter_max/page/demo/bloc/bloc_demo.dart';
import 'package:flutter_max/page/demo/drawer/drawer_demo.dart';
import 'package:flutter_max/page/demo/gridview/girdview_extend_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_builder_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_null_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_count_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_custom_demo.dart';
import 'package:flutter_max/page/demo/gridview/gridview_list_demo.dart';
import 'package:flutter_max/page/demo/http/http_demo.dart';
import 'package:flutter_max/page/demo/list/listview_builder_demo.dart';
import 'package:flutter_max/page/demo/list/listview_custom_demo.dart';
import 'package:flutter_max/page/demo/list/listview_horizontal_demo.dart';
import 'package:flutter_max/page/demo/list/listview_list_demo.dart';
import 'package:flutter_max/page/demo/list/listview_separated_demo.dart';
import 'package:flutter_max/page/demo/list/listview_vertical_demo.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_demo.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_first.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_first_page.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_second.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_second_page.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_third_page.dart';
import 'package:flutter_max/page/demo/tab/tab_bar_demo.dart';
import 'package:flutter_max/page/demo/text/rich_text_demo.dart';
import 'package:flutter_max/page/home/home_page.dart';
import 'package:flutter_max/page/widget/demo/dialog/dialog_toast_demo.dart';
import 'package:flutter_max/page/widget/demo/login/login_page.dart';
import 'package:flutter_max/page/widget/demo/refresh/refresh_load_page.dart';
import 'package:flutter_max/page/widget/demo/router/first_page.dart';
import 'package:flutter_max/page/widget/demo/search/search_demo.dart';
import 'package:flutter_max/page/widget/demo/sliver/sliver_demo.dart';
import 'package:flutter_max/page/widget/demo/splash/splash_page.dart';
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
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));
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
    NavigatorRouter(context, Login());
  }

  /// webview
  static Future showWebView(BuildContext context, String url, String title) {
    return NavigatorRouter(context, MaxWebView(url, title));
  }

  /// 欢迎界面
  static showSplash(BuildContext context) {
    return NavigatorRouter(context, Splash());
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

  static showListViewCustom(BuildContext context) {
    return NavigatorRouter(context, ListViewCustom());
  }

  static showListViewSeparated(BuildContext context) {
    return NavigatorRouter(context, ListViewSepatatedDemo());
  }

  /**************** TabBar ***************************/

  static showTabBar(BuildContext context) {
    return NavigatorRouter(context, TabBarDemo());
  }

  /**************** Drawer ***************************/

  static showDrawer(BuildContext context) {
    return NavigatorRouter(context, DrawerDemo());
  }

  /***************BottomNavigationBar ******************/

  static showBottomNavigationBar(BuildContext context) {
    return NavigatorRouter(context, BottomNavigationBarDemo());
  }

  static showBottomNavigationBarFirst(BuildContext context) {
    return NavigatorRouter(context, BottomNavigationBarFirst());
  }

  static showBottomNavigationBarSecond(BuildContext context) {
    return NavigatorRouter(context, BottomNavigationBarSecond());
  }

  static showBottomNavigationBarFirstPage(BuildContext context) {
    return NavigatorRouter(context, FirstPage());
  }

  static showBottomNavigationBarSecondPage(BuildContext context) {
    return NavigatorRouter(context, SecondPage());
  }

  static showBottomNavigationBarThirdPage(BuildContext context) {
    return NavigatorRouter(context, ThirdPage());
  }

  /********************** RichText **************************/
  static showRichText(BuildContext context) {
    return NavigatorRouter(context, RichTextDemo());
  }

  /********************** basic ***********************/
  static showBasic(BuildContext context) {
    return NavigatorRouter(context, BasicDemo());
  }

  static showContainer(BuildContext context) {
    return NavigatorRouter(context, Containers());
  }

  static showRow(BuildContext context) {
    return NavigatorRouter(context, RowDemo());
  }
  static showColume(BuildContext context) {
    return NavigatorRouter(context, ColumnDemo());
  }


  static showBloc(BuildContext context) {
    return NavigatorRouter(context, BlocDemo());
  }

  static showHttp(BuildContext context){
    return NavigatorRouter(context, HttpDemo());
  }

  static showAnimation(BuildContext context) {
    return NavigatorRouter(context, AnimationDemo());
  }

  static showSearch(BuildContext context) {
    return NavigatorRouter(context, SearchDemo());
  }

  static showRoute(BuildContext context) {
    return NavigatorRouter(context, Firstpage());
  }

  static showLoadAndRefresh(BuildContext context) {
    return NavigatorRouter(context, RefreshAndLoad());
  }

  static showSliver(BuildContext context) {
    return NavigatorRouter(context, SliverDemo());
  }

  static showDialogAndToast(BuildContext context) {
    return NavigatorRouter(context, DialogAndToastDemo());
  }



}
