import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_first_page.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_second_page.dart';
import 'package:flutter_max/page/demo/navigation_bar/bottom_navigation_bar_third_page.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class BottomNavigationBarSecond extends StatefulWidget {
  @override
  _BottomNavigationBarSecondState createState() =>
      _BottomNavigationBarSecondState();
}

class _BottomNavigationBarSecondState extends State<BottomNavigationBarSecond> {
  List<Widget> pages = List();
  int _currentIndex = 0;
  Color _tabColor = Colors.white;
  Color _tabColorSecond = Colors.white;

  _setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    pages..add(FirstPage())..add(SecondPage())..add(ThirdPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//        NavigatorUtils.showBottomNavigationBarFirstPage(context);
          setState(() {
            _currentIndex = 2;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlueAccent,
        shape: CircularNotchedRectangle(),
        child: tabs(),
      ),
    );
  }

  Row tabs() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Container(
          child: IconButton(
            icon: Icon(Icons.ev_station),
            color: _tabColor,
            onPressed: () {
              setState(() {
                _tabColor = Colors.purpleAccent;
                _currentIndex = 0;
                _tabColorSecond = Colors.black;
              });
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.free_breakfast),
          disabledColor: Colors.white,
          color: _tabColorSecond,
          onPressed: () {
            setState(() {
              _tabColorSecond = Colors.purpleAccent;
              _tabColor = Colors.black;
              _currentIndex = 1;
            });
          },
        ),
      ],
    );
  }
}
