import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/27.
 * Describe:
 */

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tooltip(message: "This is ToolTips",
      height: 60.0,
      preferBelow: false,
      padding: EdgeInsets.all(10.0),),
    );
  }
}
