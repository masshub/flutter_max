import 'package:flutter/material.dart';
import 'package:flutter_max/control/option_control.dart';
import 'package:flutter_max/widget/max_common_option.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

///
/// Created by Maker on 2019/2/26.
/// Describe: webView

class MaxWebView extends StatelessWidget {
  final String url;
  final String title;
  final OptionControl control = OptionControl();

  MaxWebView(this.url, this.title);

  _webviewTitle() {
    if(url == null || url.length == 0) {
      return Text(title);
    }
    control.url = url;
    return Row(
      children: <Widget>[
        Expanded(child: Container()),
            MaxCommonOption(control),
      ],
    );
  }




  @override
  Widget build(BuildContext context) {

    return WebviewScaffold(
      withJavascript: true,
      url: url,
      scrollBar: true,
      withLocalUrl: true,
      appBar: AppBar(
        title: _webviewTitle(),

      ),

    );
  }




}
