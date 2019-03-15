import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
 */

class ListViewCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewCustom'),
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: <Widget>[
              Image.asset(images[index].imageUrl),
              Divider(
                color: Color.fromRGBO(237, 234, 237, 1.0),
                height: 8.0,
              )
            ],
          );
        }, childCount: images.length),
      ),
    );
  }
}
