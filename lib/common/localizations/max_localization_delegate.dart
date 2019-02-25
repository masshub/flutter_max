import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_max/common/localizations/default_localizations.dart';

///
/// Created by Maker on 2019/2/25.
/// Describe:
///
///

class MaxLocalizationDelegate extends LocalizationsDelegate<MaxLocalizations> {
  MaxLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<MaxLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<MaxLocalizations>(new MaxLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<MaxLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }


  static MaxLocalizationDelegate delegate = MaxLocalizationDelegate();

}
