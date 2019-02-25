import 'package:flutter/material.dart';
import 'package:flutter_max/common/local/local_storage.dart';
import 'package:flutter_max/common/rerdux/maxBase.dart';
import 'package:flutter_max/common/utils/common_utils.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_max/common/config/config.dart';

///
/// Created by Maker on 2019/2/25.
/// Describe: 侧滑页
///
class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  showThemeDialog(BuildContext context, Store store) {
    List<String> list = [
      CommonUtils.getLocale(context).home_theme_default,
      CommonUtils.getLocale(context).home_theme_1,
      CommonUtils.getLocale(context).home_theme_2,
      CommonUtils.getLocale(context).home_theme_3,
      CommonUtils.getLocale(context).home_theme_4,
      CommonUtils.getLocale(context).home_theme_5,
      CommonUtils.getLocale(context).home_theme_6,
    ];

    CommonUtils.showCommitOptionDialog(context, list, (index) {
      CommonUtils.pushTheme(store, index);
      LocalStorage.save(Config.THEME_COLOR, index.toString());
    }, colorList: CommonUtils.getThemeListColor());
  }

  showLanguageDialog(BuildContext context, Store store) {
    List<String> list = [
      CommonUtils.getLocale(context).home_language_default,
      CommonUtils.getLocale(context).home_language_zh,
      CommonUtils.getLocale(context).home_language_en,
    ];
    CommonUtils.showCommitOptionDialog(context, list, (index) {
      CommonUtils.changeLocale(store, index);
      LocalStorage.save(Config.LOCALE, index.toString());
    }, height: 150.0);
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoreBuilder<MaxState>(builder: (context, store) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('max'),
                accountEmail: Text('www.max@max.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
                  radius: 35.0,
                ),
              ),
              ListTile(
                title: Text(CommonUtils.getLocale(context).home_change_theme),
                leading: new CircleAvatar(
                  child: Icon(Icons.school),
                ),
                onTap: () {
                  showThemeDialog(context, store);
                },
              ),
              ListTile(
                title: Text(CommonUtils.getLocale(context).home_language_default),
                leading: new CircleAvatar(
                  child: Icon(Icons.language),
                ),
                onTap: () {
                  showLanguageDialog(context, store);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
