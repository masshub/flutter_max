import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_max/widget/bottom_cliper.dart';

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
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: BottomCliper(),
              child: Container(
                color: Colors.lightBlue,
                height: 200,
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 80.0,),
                  FlutterLogo(
                    size: 200.0,
                    colors: Colors.blue,
                  ),
                ],
              )),

          Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Opacity(
                  opacity: 0.5,
                  child: new Container(
                    margin: EdgeInsets.only(top: 80.0),
                    width: 120.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: new Center(
                      child: new Text('Flutter',
                          style: Theme.of(context).textTheme.display1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
