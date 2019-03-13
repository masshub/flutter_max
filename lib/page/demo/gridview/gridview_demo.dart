import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/13.
 * Describe:
 */

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * 可以传入SliverGridDelegateWithFixedCrossAxisCount对象和SliverGridDelegateWithMaxCrossAxisExtent对象。
        其中SliverGridDelegateWithFixedCrossAxisCount可以直接指定每行（列）显示多少个Item，
        SliverGridDelegateWithMaxCrossAxisExtent会根据GridView的宽度和你设置的每个的宽度来自动计算没行显示多少个Item
     */
    return GridView(gridDelegate: null);
  }
}
