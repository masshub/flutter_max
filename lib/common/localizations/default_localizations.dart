import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_strings.dart';
import 'package:flutter_max/common/styles/max_strings_en.dart';
import 'package:flutter_max/common/styles/max_strings_zh.dart';
import 'dart:ui';

///
/// Created by Maker on 2019/2/25.
/// Describe:
///
/// 自定义多语言实现
class MaxLocalizations {
  final Locale locale;

  MaxLocalizations(this.locale);

  static Map<String, MaxStrings> _localizationsValues = {
    'en': StringsEN(),
    'zh': StringsZH(),
  };

  MaxStrings get currentLocalized {
    return _localizationsValues[locale.languageCode];
  }

  /// 通过localizations加载当前的MaxLocalizations
  /// 获取对应的StringBase
  static MaxLocalizations of(BuildContext context) {
    return Localizations.of(context, MaxLocalizations);
  }
}
