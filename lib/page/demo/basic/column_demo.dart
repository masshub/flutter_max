import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column'),
        centerTitle: true,
      ),
      body: Column(
        /** spaceAround  首尾空白总和等于中间空白区域
         * spaceBetween  首尾没有空白
         * spaceEvently  空白区域均相等**/
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        ///
        /// strech  水平平铺
        ///
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.lightBlueAccent,
            alignment: Alignment.center,
            child:Icon(Icons.wb_sunny,color: Colors.white,size: 99.0,),
          ),

          Container(
            alignment: Alignment.center,
            color: Colors.lightBlueAccent,
            child:Icon(Icons.grain,color: Colors.white,size: 99.0,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.lightBlueAccent,
            child:Icon(Icons.wb_iridescent,color: Colors.white,size: 99.0,),
          ),
        ],
      ),
    );
  }
}
