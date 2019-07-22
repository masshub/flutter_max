import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';
import 'package:flutter_max/page/demo/animation/PhotoHero.dart';
import 'package:flutter_max/page/demo/animation/animation_demo_home.dart';

/**
 * Created by Maker on 2019/3/26.
 * Describe:
 */

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  AnimationStatus animationStatus;
  double value;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
        Tween<double>(begin: 30.0, end: 300.0).animate(animationController)
          ..addListener(() {
            value = animation.value;
            setState(() {});
          })
          ..addStatusListener((AnimationStatus state) {
            animationStatus = state;
            setState(() {});
          });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          AnimationDemoHome(),
          FlatButton(
              onPressed: () {
                animationController.reset();
                animationController.forward();
              },
              child: Text("start")),
          Text("AnimationState:$animationStatus"),
          Text("AnimationValue:$value"),
          Container(
            height: value,
            width: value,
            child: FlutterLogo(),
          ),
//          AnimationLogo(
//            child: AnimationDemo(),
//            animation: animation,
//          ),
//          PhotoHero(),
          FlatButton(onPressed: (){
            NavigatorUtils.showPhotoHero(context);
          }, child: Text("PhotoHero")),
          FlatButton(onPressed: (){
            NavigatorUtils.showDistanceNotification(context);
          }, child: Text("DistanceNotification"))
        ],
      ),
    );
  }
}

class AnimationLogo extends StatelessWidget {
  final Widget child;
  final Animation animation;

  AnimationLogo({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Container(
          height: animation.value,
          width: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}
