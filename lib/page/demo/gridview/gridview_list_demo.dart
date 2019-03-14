import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
 */

class GridViewList extends StatelessWidget {
  static final String mName = 'gridview_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('GridView'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.grid_on,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('GridView'),
            onTap: () {
              NavigatorUtils.showGridViews(context);
            },
          ),
          Container(
            height: 4.0,
            color: Color.fromRGBO(237, 237, 237, 1.0),
          ),
          ListTile(
            leading: Icon(
              Icons.grid_on,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('GridViewExtent'),
            onTap: () {
              NavigatorUtils.showGridViewExtent(context);
            },
          ),
          Container(
            height: 4.0,
            color: Color.fromRGBO(237, 237, 237, 1.0),
          ),
          ListTile(
            leading: Icon(
              Icons.grid_on,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('GridViewExtent'),
            onTap: () {
              NavigatorUtils.showGridViewCount(context);
            },
          ),
          Container(
            height: 4.0,
            color: Color.fromRGBO(237, 237, 237, 1.0),
          ),
          ListTile(
            leading: Icon(
              Icons.grid_on,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('GridViewCustom'),
            onTap: () {
              NavigatorUtils.showGridViewCustom(context);
            },
          ),
          Container(
            height: 4.0,
            color: Color.fromRGBO(237, 237, 237, 1.0),
          ),
          ListTile(
            leading: Icon(
              Icons.grid_on,
              color: Colors.lightBlueAccent,
            ),
            trailing: Icon(Icons.chevron_right),
            title: Text('GridViewBuilder'),
            onTap: () {
              NavigatorUtils.showGridViewBuilder(context);
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
