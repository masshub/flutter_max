import 'package:flutter/material.dart';

///
/// Created by Maker on 2019/2/25.
/// Describe:
///
///

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Center(
        child: MaterialButton(
          onPressed: ()=>Navigator.pop(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('SecondPage',style: TextStyle(color: Colors.white,fontSize: 34.0),),
              Icon(
                Icons.navigate_next,
                color: Colors.white,
                size: 64.0,
              ),
            ],

          )
        ),
      ),
    );
  }
}
