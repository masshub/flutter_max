import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

/**
 * Created by Maker on 2019/3/13.
 * Describe:
 */

class GridViewExtent extends StatefulWidget {
  @override
  _GridViewExtentState createState() => _GridViewExtentState();
}

class _GridViewExtentState extends State<GridViewExtent> {
  @override
  Widget build(BuildContext context) {
    List<Container> _buildGraidViewTitleList(int count) {
      return List<Container>.generate(
        count,
        (int index) => Container(
              child: Image.asset(
                images[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('GridViewExtent'),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 250.0,
        padding: EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGraidViewTitleList(images.length),
      ),
    );
  }
}
