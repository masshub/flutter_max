import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/13.
 * Describe:
 */

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DemoPage'),),
    );
  }
}
