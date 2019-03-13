import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/common_utils.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';
import 'package:flutter_max/page/demo/gridview/girdview_extend_demo.dart';
import 'package:flutter_max/page/home/NewsListPage.dart';
import 'package:flutter_max/page/drawer_page.dart';


///
/// Created by Maker on 2019/1/11.
/// Describe: home
///

class HomePage extends StatefulWidget {
  static final String mName = 'home';
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 单击提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              content: new Text(CommonUtils.getLocale(context).app_back_tip),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text(CommonUtils.getLocale(context).app_cancel)),
                new FlatButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/splash", (route) => route == null);
                    },
                    child: new Text(CommonUtils.getLocale(context).app_ok))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _dialogExitApp(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title??'home'),
          centerTitle: true,
        ),
        drawer: DrawerPage(),
        body: Container(
          child: GridViewDemo(),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
