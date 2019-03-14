import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
 */

class GridViewCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridViewCustom'),
      ),
      body: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 6.0, crossAxisSpacing: 6.0),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            return Image.asset(images[index].imageUrl);
          }, childCount: images.length)),
    );
  }
}
