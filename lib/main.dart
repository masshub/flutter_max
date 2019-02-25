import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_max/common/localizations/max_localization_delegate.dart';
import 'package:flutter_max/common/rerdux/maxBase.dart';
import 'package:flutter_max/common/styles/max_colors.dart';
import 'package:flutter_max/common/utils/common_utils.dart';
import 'package:flutter_max/page/home_page.dart';
import 'package:flutter_max/page/login_page.dart';
import 'package:flutter_max/page/splash_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final store = Store<MaxState>(appReducer,
      initialState: MaxState(
        themeData: CommonUtils.getThemeData(MaxColors.primarySwatch),
        locale: Locale('zh', 'CH'),
      ));

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreBuilder<MaxState>(builder: (context, store) {
        return MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            MaxLocalizationDelegate.delegate,
          ],
          locale: store.state.locale,
          supportedLocales: [store.state.locale],
          title: 'Flutter Max',
          debugShowCheckedModeBanner: false,
          theme: store.state.themeData,
          initialRoute: '/splash',
          routes: {
            '/': (context) {
              return MAXLocalizations(
                child: HomePage(title: 'Home'),
              );
            },
            '/splash': (context) {
              store.state.platformLocale = Localizations.localeOf(context);
              return Splash();
            },
            '/login': (context) => Login(),
          },
        );
      }),
    );
  }
}

class MAXLocalizations extends StatefulWidget {
  final Widget child;

  MAXLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<MAXLocalizations> createState() {
    return new _MAXLocalizations();
  }
}

class _MAXLocalizations extends State<MAXLocalizations> {
  StreamSubscription stream;

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<MaxState>(builder: (context, store) {
      ///通过 StoreBuilder 和 Localizations 实现实时多语言切换
      return new Localizations.override(
        context: context,
        locale: store.state.locale,
        child: widget.child,
      );
    });
  }
}
