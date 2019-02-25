import 'package:flutter/material.dart';
import 'package:flutter_max/common/rerdux/themeReducer.dart';
import 'package:flutter_max/common/rerdux/locale_reducer.dart';

///
/// Created by Maker on 2019/2/25.
/// Describe:事件redux
///
class MaxState {
  // 主题数据
  ThemeData themeData;
  Locale locale;
  ///当前手机平台默认语言
  Locale platformLocale;
  // 构造方法
  MaxState({this.themeData, this.locale});
}

MaxState appReducer(MaxState state, action) {
  return MaxState(
      themeData: themeDataReducer(state.themeData, action),
      locale: localeReducer(state.locale, action));
}
