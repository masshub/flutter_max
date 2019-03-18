import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.wb_sunny,color: Colors.lightBlueAccent,size: 99.0,),
          Icon(Icons.grain,color: Colors.lightBlueAccent,size: 99.0,),
          Icon(Icons.wb_iridescent,color: Colors.lightBlueAccent,size: 99.0,),
        ],
      ),
    );
  }
}
