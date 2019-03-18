import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class ListViewSepatatedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _sepatatedItemBuilder(context, index) {
      return Container(
        margin: EdgeInsets.all(10.0),
        child: Image.asset(images[index].imageUrl),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewSepatated'),
        elevation: 0.0,
        centerTitle: true,
      ),
        body: ListView.separated(
          itemBuilder: _sepatatedItemBuilder,
          separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.lightBlue,height: 14.0,),
          itemCount: images.length),
    );
  }
}
