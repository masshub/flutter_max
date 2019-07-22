import 'package:flutter/material.dart';
import 'package:flutter_max/page/demo/http/http_demo_home.dart';

/**
 * Created by Maker on 2019/3/26.
 * Describe:
 */

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http'),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,

      ),
      body: HttpDemoHome(),
    );
  }
}
