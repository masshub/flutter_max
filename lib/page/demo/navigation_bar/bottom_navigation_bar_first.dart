import 'package:flutter/material.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_first_page.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_fourth_page.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_second_page.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_third_page.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class BottomNavigationBarFirst extends StatefulWidget {
  @override
  _BottomNavigationBarFirstState createState() =>
      _BottomNavigationBarFirstState();
}

class _BottomNavigationBarFirstState extends State<BottomNavigationBarFirst> {
  int _currentIndex = 0;
  List<Widget> pages = List();

  _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    pages
      ..add(FirstPage())
      ..add(SecondPage())
      ..add(ThirdPage())
      ..add(FourthPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: _setCurrentIndex,
              fixedColor: Colors.lightBlueAccent,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance), title: Text('Account')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bubble_chart), title: Text('Bubble')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.cake), title: Text('Cake')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.devices_other), title: Text('Devices')),
              ]),
          body: pages[_currentIndex],
        ));
  }
}
