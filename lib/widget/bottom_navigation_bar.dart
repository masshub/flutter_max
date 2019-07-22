import 'package:flutter/material.dart';
import 'package:flutter_max/page/home/NewsDetailPage.dart';
import 'package:flutter_max/page/home/NewsListPage.dart';
import 'package:flutter_max/page/demo/demo_page.dart';
import 'package:flutter_max/page/home/home_page.dart';
import 'package:flutter_max/page/others/others_page.dart';
import 'package:flutter_max/page/widget/widget_page.dart';

/**
 * Created by Maker on 2019/3/13.
 * Describe:
 */

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final _bottomNavigationBarColor = Colors.lightBlueAccent;
  int currentIndex = 0;
  List<Widget> pages = List();

  @override
  void initState() {
    pages
      ..add(HomePage())
      ..add(NewsListPage())
      ..add(WidgetPage())
      ..add(OthersPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _bottomNavigationBarColor,
                ),
                title: Text(
                  'HOME',
                  style: TextStyle(color: _bottomNavigationBarColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books,
                  color: _bottomNavigationBarColor,
                ),
                title: Text(
                  'DEMO',
                  style: TextStyle(color: _bottomNavigationBarColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.widgets,
                  color: _bottomNavigationBarColor,
                ),
                title: Text(
                  'WIDGET',
                  style: TextStyle(color: _bottomNavigationBarColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.devices_other,
                  color: _bottomNavigationBarColor,
                ),
                title: Text(
                  'OTHERS',
                  style: TextStyle(color: _bottomNavigationBarColor),
                )),
          ]),
    );
  }
}
