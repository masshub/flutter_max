import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
 */

class ListViewCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewCustom'),
      ),
      body: ListView.custom(childrenDelegate: null),
    );
  }
}
