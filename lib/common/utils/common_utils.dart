import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_max/common/localizations/default_localizations.dart';
import 'package:flutter_max/common/rerdux/locale_reducer.dart';
import 'package:flutter_max/common/rerdux/maxBase.dart';
import 'package:flutter_max/common/rerdux/themeReducer.dart';
import 'package:flutter_max/common/styles/max_colors.dart';
import 'package:flutter_max/common/styles/max_strings.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';
import 'dart:async';

import 'package:flutter_max/widget/max_flex_button.dart';
import 'package:flutter_max/widget/max_web_view.dart';
import 'package:redux/redux.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// Created by Maker on 2019/2/25.
/// Describe:
///

class CommonUtils {

  /**
   * 切换语言
   */
  static changeLocale(Store<MaxState> store, int index) async {
    Locale locale = store.state.platformLocale;
    switch (index) {
      case 1:
        locale = Locale('zh', 'CH');
        break;
      case 2:
        locale = Locale('en', 'US');
        break;
    }
    store.dispatch(RefreshLocaleAction(locale));
  }

  static pushTheme(Store store,int index) {
    ThemeData themeData;
    List<Color> colors = getThemeListColor();
    themeData = getThemeData(colors[index]);
    store.dispatch(RefreshThemeDataAction(themeData));
  }

  static getThemeData(Color color) {
    return ThemeData(primarySwatch: color,platform: TargetPlatform.android);
  }

  static MaxStrings getLocale(BuildContext context) {
    return MaxLocalizations.of(context).currentLocalized;
  }

  static List<Color> getThemeListColor() {
    return [
      MaxColors.primarySwatch,
      Colors.brown,
      Colors.blue,
      Colors.teal,
      Colors.amber,
      Colors.blueGrey,
      Colors.deepOrange,
    ];
  }

  static Future<Null> showCommitOptionDialog(
    BuildContext context,
    List<String> commitMaps,
    ValueChanged<int> onTap, {
    width = 250.0,
    height = 400.0,
    List<Color> colorList,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.all(4.0),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(MaxColors.white),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: ListView.builder(
                itemCount: commitMaps.length,
                itemBuilder: (context, index) {
                  return MaxFlexButton(
                    maxLines: 2,
                    mainAxisAlignment: MainAxisAlignment.start,
                    fontSize: 14.0,
                    color: colorList != null
                        ? colorList[index]
                        : Theme.of(context).primaryColor,
                    text: commitMaps[index],
                    textColor: Color(MaxColors.white),
                    onPress: () {
                      Navigator.pop(context);
                      onTap(index);
                    },
                  );
                },
              ),
            ),
          );
        });
  }


  static launchOutUrl(BuildContext context,String url) async {
    if(await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: CommonUtils.getLocale(context).option_web_launcher_error + ": " + url);
    }
  }

  ///
  /// 复制数据
  ///
  static copy(BuildContext context,String data) {
    if(data != null) {
      Clipboard.setData(ClipboardData(text: data));
      Fluttertoast.showToast(msg: CommonUtils.getLocale(context).option_share_copy_success);
    }

  }



  static void lannchWebView(BuildContext context,String url,String title){
    if(url.startsWith('http') || url.startsWith('https')) {
      NavigatorUtils.showWebView(context, url, title);
    } else {
      NavigatorUtils.showWebView(context, Uri.dataFromString(url,mimeType: 'text/html',encoding: Encoding.getByName('utf-8')).toString(), title);
    }
  }



}
