import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class BottomNavigationBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('BottomNavigationBarFirst'),
            trailing: Icon(Icons.navigate_next),
            leading: Icon(Icons.navigation),
            onTap: (){
              NavigatorUtils.showBottomNavigationBarFirst(context);
            },
          ),

          Divider(
            height: 8.0,
            color: Colors.lightBlueAccent,
          ),

          ListTile(
            title: Text('BottomNavigationBarSecond'),
            trailing: Icon(Icons.navigate_next),
            leading: Icon(Icons.navigation),
            onTap: (){
              NavigatorUtils.showBottomNavigationBarSecond(context);
            },
          ),
          Divider(
            height: 8.0,
            color: Colors.lightBlueAccent,
          ),

        ],
      ),
    );
  }
}
