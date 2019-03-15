import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
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

        ],
      ),
    );
  }
}
