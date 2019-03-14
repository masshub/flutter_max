import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
 */

class ListViewHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewHorizontal'),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Image.asset(images[00].imageUrl),
          Image.asset(images[01].imageUrl),
          Image.asset(images[02].imageUrl),
          Image.asset(images[03].imageUrl),
          Image.asset(images[04].imageUrl),
          Image.asset(images[05].imageUrl),
          Image.asset(images[06].imageUrl),
        ],
      ),
    );
  }
}
