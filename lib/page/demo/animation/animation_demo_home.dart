import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/27.
 * Describe:
 */

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColors;
  CurvedAnimation curvedAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
//        lowerBound: 10.0,
//        // 最小值
//        upperBound: 100.0,
//        // 最大值
//        value: 32.0 // 初始值
    );

    curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);

    animation = Tween(begin: 29.0, end: 100.0).animate(curvedAnimation);
    animationColors = ColorTween(begin: Colors.red, end: Colors.red[900])
        .animate(curvedAnimation);

    animationController.addListener(() {
//      print('${animationController.value}');
      setState(() {});
    });

    animationController.addStatusListener((AnimationStatus status) {
      print('$status');
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      }
//      else if (status == AnimationStatus.dismissed) {
//        animationController.forward();
//      }
    });

//    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimationHeart(
      animations: [
        animationColors,
        animation,
      ],
      controller: animationController,
    ));
  }
}

class AnimationHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimationHeart({this.animations, this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
        icon: Icon(
          Icons.favorite,
        ),
        color: animations[0].value,
        iconSize: animations[1].value,
        onPressed: () {
          switch (controller.status) {
            case AnimationStatus.completed:
              controller.reverse();
              break;
            default:
              controller.forward();
              break;
          }
        });
  }
}
