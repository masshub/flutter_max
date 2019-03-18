import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
 *
 * this.leading,              // item 前置图标
    this.title,                // item 标题
    this.subtitle,             // item 副标题
    this.trailing,             // item 后置图标
    this.isThreeLine = false,  // item 是否三行显示
    this.dense,                // item 直观感受是整体大小
    this.contentPadding,       // item 内容内边距
    this.enabled = true,
    this.onTap,                // item onTap 点击事件
    this.onLongPress,          // item onLongPress 长按事件
    this.selected = false,     // item 是否选中状态
 */

class ListViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('ListViewVertical'),
            onTap: () {
              NavigatorUtils.showListViewVertical(context);
            },
          ),
          Container(
            height: 4.0,
            color: Color.fromRGBO(237, 237, 237, 1.0),
          ),
          ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('ListViewHorizontal'),
            onTap: () {
              NavigatorUtils.showListViewHorizontal(context);
            },
          ),
          Container(
            height: 4.0,
            color: Color.fromRGBO(237, 237, 237, 1.0),
          ),
          ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('ListViewBuilder'),
            onTap: () {
              NavigatorUtils.showListViewBuilder(context);
            },
          ),
          Container(
            height: 4.0,
            color: Color.fromRGBO(237, 237, 237, 1.0),
          ),
          ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('ListViewCustom'),
            onTap: () {
              NavigatorUtils.showListViewCustom(context);
            },
          ),
          Container(
            height: 4.0,
            color: Color.fromRGBO(237, 237, 237, 1.0),
          ),
          ListTile(
            leading: Icon(
              Icons.list,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('ListViewSepatated'),
            onTap: () {
              NavigatorUtils.showListViewSeparated(context);
            },
          ),
          Container(
            height: 4.0,
            color: Color.fromRGBO(237, 237, 237, 1.0),
          ),

        ],
      ),
    );
  }
}
