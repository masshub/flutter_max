import 'dart:async';

import 'package:flutter/material.dart';
///
/// Created by Maker on 2019/1/11.
/// Describe: 欢迎界面
///

class Splash extends StatefulWidget {
  static final String mName = 'splash';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),() => Navigator.pushNamed(context, '/login'));

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text('SPLASH',style: TextStyle(color: Colors.white,fontSize: 44.0),),
      ),
    );
  }

}

