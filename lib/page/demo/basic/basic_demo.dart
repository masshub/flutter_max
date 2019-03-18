import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础控件'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.shopping_basket,
              color: Colors.lightBlueAccent,
            ),
            title: Text('Container'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              NavigatorUtils.showContainer(context);
            },
          ),
          Divider(
            height: 4.0,
            color: Colors.red,
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_basket,
              color: Colors.lightBlueAccent,
            ),
            title: Text('Row'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              NavigatorUtils.showRow(context);
            },
          ),
          Divider(
            height: 4.0,
            color: Colors.red,
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_basket,
              color: Colors.lightBlueAccent,
            ),
            title: Text('Column'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              NavigatorUtils.showColume(context);
            },
          ),
          Divider(
            height: 4.0,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
