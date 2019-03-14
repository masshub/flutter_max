import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
 */

class GridViewCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridViewCount'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(6.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _list(images.length),
      ),
    );
  }

  List<Container> _list(int count) {
    return List.generate(count, (int index) {
      return Container(
        child: Image.asset(images[index].imageUrl),
      );
    });
  }
}
