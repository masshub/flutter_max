import 'package:flutter/material.dart';
import 'package:flutter_max/page/widget/demo/search/search_delegate_demo.dart';

/**
 * Created by Maker on 2019/3/27.
 * Describe:
 */

class SearchDemo extends StatefulWidget {
  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: ()=> showSearch(context: context, delegate: SearchDelegateDemo())),

        ],
      ),
    );
  }
}
