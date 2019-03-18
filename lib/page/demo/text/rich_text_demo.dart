import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RichText'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Center(
          child: RichText(
            text: TextSpan(
              text: 'RichText',
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
              children: [
                TextSpan(
                    text: '@richtext',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ));
  }
}
