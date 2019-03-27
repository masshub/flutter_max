import 'package:flutter/material.dart';
import 'package:flutter_max/page/widget/demo/dialog/tooltip_demo.dart';
import 'package:flutter_max/page/widget/demo/router/custom_router.dart';

/**
 * Created by Maker on 2019/3/27.
 * Describe:
 */

class DialogAndToastDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog&Toast'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Text(
            'Toast',
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          Container(
            child: Tooltip(
              message: 'this is tooltips',
              height: 60.0,
              preferBelow: true,
              child: ListTile(
                title: Text('ToolTip'),
                leading: Icon(
                  Icons.toys,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          ListTile(
            title: Text('SnackBar'),
            leading: Icon(
              Icons.sentiment_neutral,
              color: Colors.lightBlue,
            ),
            onTap: () {

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Loading.......'),
                action: SnackBarAction(label: 'ok', onPressed: () {}),
              ));
            },
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          Text(
            'Dialog',
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          ListTile(
            title: Text('AboutDialog'),
            leading: Icon(
              Icons.dialpad,
              color: Colors.lightBlue,
            ),
            onTap: () {},
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          ListTile(
            title: Text('AlertDialog'),
            leading: Icon(
              Icons.add_alert,
              color: Colors.lightBlue,
            ),
            onTap: () {},
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          ListTile(
            title: Text('SimpleDialog'),
            leading: Icon(
              Icons.settings_input_antenna,
              color: Colors.lightBlue,
            ),
            onTap: () {},
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          ListTile(
            title: Text('BottomSheetDialog'),
            leading: Icon(
              Icons.border_bottom,
              color: Colors.lightBlue,
            ),
            onTap: () {},
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          ListTile(
            title: Text('ModalBottomSheetDialog'),
            leading: Icon(
              Icons.mouse,
              color: Colors.lightBlue,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
