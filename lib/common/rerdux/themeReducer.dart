import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

///
/// Created by Maker on 2019/2/25.
/// Describe:
///

/// 通过flutter_redux的conbineReducers，实现reducer方法
///
final themeDataReducer = combineReducers<ThemeData>([
  /// 将action，处理action的方法，state绑定
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh),
]);

/// 定义处理action行为的方法，返回新的state
ThemeData _refresh(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}


/// 定义一个action
/// 将该action在reducer中与处理该action的方法绑定
class RefreshThemeDataAction {
  final ThemeData themeData;
  RefreshThemeDataAction(this.themeData);
}
