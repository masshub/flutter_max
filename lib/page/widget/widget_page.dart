import 'package:flutter/material.dart';
import 'package:flutter_max/page/widget/widget_page_home.dart';

/**
 * Created by Maker on 2019/3/13.
 * Describe:
 */

class WidgetPage extends StatefulWidget {
  @override
  _WidgetPageState createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: WidgetPageHome(),
    );
  }
}
