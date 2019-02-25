import 'package:flutter/material.dart';

///
/// Created by Maker on 2019/2/25.
/// Describe: 标题栏

class MaxTitleBar extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPress;
  final bool needRightLocalIcon;
  final Widget rightWidget;

  const MaxTitleBar(this.title,
      {this.iconData,
      this.onPress,
      this.needRightLocalIcon = false,
      this.rightWidget});

  @override
  Widget build(BuildContext context) {
    Widget right = rightWidget;
    if (right == null) {
      right = (needRightLocalIcon)
          ? IconButton(icon: Icon(iconData), onPressed: onPress)
          : Container();
    }
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
          right,
        ],
      ),
    );
  }
}
