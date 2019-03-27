import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/27.
 * Describe:
 */

class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  CustomRoute(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 2),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget widget) {
              /// 淡入淡出
//              return FadeTransition(
//                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                    parent: animation, curve: Curves.fastOutSlowIn)),
//                child: widget,
//              );
              //比例转换
//          return ScaleTransition(
//            scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//                parent: animation, curve: Curves.fastOutSlowIn)),
//            child: widget,
//            );

              //旋转+比例转换
            return RotationTransition(
              turns: Tween(begin: -1.0, end: 1.0).animate(CurvedAnimation(
                  parent: animation, curve: Curves.fastOutSlowIn)),
              child: ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
                child: widget,
              ),
            );

              //幻灯片路由
//            return SlideTransition(
//              position:
//                  Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
//                      .animate(CurvedAnimation(
//                          parent: animation, curve: Curves.fastOutSlowIn)),
//              child: widget,
//            );











            });
}
