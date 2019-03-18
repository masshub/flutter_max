import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar'),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.view_list),
              onPressed: () {
                Fluttertoast.showToast(msg: "Don't Touch Me");
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Fluttertoast.showToast(msg: "Don't Touch Me");
                })
          ],
          bottom: TabBar(tabs: <Widget>[
            Icon(Icons.directions_bike),
            Icon(Icons.swap_calls),
            Icon(Icons.local_car_wash),
          ],
          unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            indicatorWeight: 1.0,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        body: TabBarView(children: <Widget>[
          Icon(
            Icons.directions_bike,
            size: 111.0,
          ),
          Icon(
            Icons.swap_calls,
            size: 111.0,
          ),
          Icon(
            Icons.local_car_wash,
            size: 111.0,
          ),
        ]),
      ),
    );
  }
}
