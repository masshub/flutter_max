import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text('WidgetPage'),),
    );
  }
}
