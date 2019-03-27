import 'package:flutter/material.dart';
import 'package:flutter_max/page/demo/animation/animation_demo_home.dart';

/**
 * Created by Maker on 2019/3/26.
 * Describe:
 */

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );

  }
}
