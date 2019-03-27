import 'package:flutter/material.dart';
import 'package:flutter_max/page/widget/demo/router/custom_router.dart';
import 'package:flutter_max/page/widget/demo/router/second_page.dart';

///
/// Created by Maker on 2019/2/25.
/// Describe:
///
///

class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(CustomRoute(SecondPage()));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('FirstPage',style: TextStyle(color: Colors.white,fontSize: 34.0),),
                Icon(
                  Icons.navigate_next,
                  color: Colors.white,
                  size: 64.0,
                ),
              ],

            )),
      ),
    );
  }
}
