import 'package:flutter/material.dart';

///
/// Created by Maker on 2019/7/22.
/// Description:
///

class ListViewExpansionDemo extends StatefulWidget {
  @override
  _ListViewExpansionDemoState createState() => _ListViewExpansionDemoState();
}

class _ListViewExpansionDemoState extends State<ListViewExpansionDemo> {
  static const data = {
    "first": ["1", "2", "3", "4", "5", "6", "7"],
    "second": ["red", "blue", "yellow", "white", "black", "cayan"],
    "third": ["one", "two", "three", "four", "five", "six"],
    "fourth": ["shanghai", "wuhan", "hangzhou", "shenzheng"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewExpansion"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children:  _buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> widgets = [];
    data.keys.forEach((key) {
      widgets.add(_item(key, data[key]));
    });
    return widgets;
  }

  Widget _item(String key, List<String> value) {
    return ExpansionTile(
        title: Text(
      key,
      style: TextStyle(color: Colors.black, fontSize: 20.0),
    ),
    backgroundColor: Colors.lightBlue,
    children: value.map((values) => _buildValues(values)).toList(),);
  }

  Widget _buildValues(String values) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        height: 50.0,
        color: Colors.lightBlueAccent,
        margin: EdgeInsets.all(10.0),
        child:Text(values,style: TextStyle(color: Colors.white),),
      ),
    );

  }
}
