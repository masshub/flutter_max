import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';

/**
 * Created by Maker on 2019/3/13.
 * Describe:
 */

class OthersPage extends StatefulWidget {
  @override
  _OthersPageState createState() => _OthersPageState();
}

class _OthersPageState extends State<OthersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OthersPage'),),
      body: Center(
        child: FlatButton(onPressed: (){
          NavigatorUtils.showTripPage(context);
        }, child: Text("Trip",style: TextStyle(color: Colors.black,fontSize: 22.0),)),
      ),
    );

  }
}
