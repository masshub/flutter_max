import 'package:flutter/material.dart';
import 'package:flutter_max/page/demo/drawer/drawer_widget.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      endDrawer: DrawerWidget(),
    );
  }
}

