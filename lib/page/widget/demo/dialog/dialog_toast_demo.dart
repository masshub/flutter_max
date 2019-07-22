import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * Created by Maker on 2019/3/27.
 * Describe:
 */

enum Options { A, B, C }

enum Actions { Cancel, Ok }

class DialogAndToastDemo extends StatefulWidget {
  @override
  _DialogAndToastDemoState createState() => _DialogAndToastDemoState();
}

class _DialogAndToastDemoState extends State<DialogAndToastDemo> {
  String choices = 'Nothing';
  String action = 'Nothing';

  final bottomSheetKey = GlobalKey<ScaffoldState>();

  Future showSimpleDialog() async {
    final options = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('simpleDialog'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  Navigator.pop(context, Options.A);
                  Fluttertoast.showToast(msg: 'Option A');
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  Navigator.pop(context, Options.B);
                  Fluttertoast.showToast(msg: 'Option B');
                },
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  Navigator.pop(context, Options.C);
                  Fluttertoast.showToast(msg: 'Option C');
                },
              ),
              SimpleDialogOption(
                child: Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });

    switch (options) {
      case Options.A:
        setState(() {
          choices = 'A';
        });
        break;
      case Options.B:
        setState(() {
          choices = 'B';
        });
        break;
      case Options.C:
        setState(() {
          choices = 'C';
        });
        break;
      default:
        break;
    }
  }

  Future showAlertDialog() async {
    final actionss = await showDialog(
        context: context,
        barrierDismissible: true, //点击空白区域是否关闭dialog
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Are your sure about this ?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Actions.Cancel);
                  },
                  child: Text('Cancel')),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Actions.Ok);
                  },
                  child: Text('Ok')),
            ],
          );
        });

    switch (actionss) {
      case Actions.Cancel:
        setState(() {
          action = "Cancel";
        });

        break;
      case Actions.Ok:
        setState(() {
          action = "Ok";
        });
        break;
      default:
        break;
    }
  }

  // 显示后任可进行其他操作
  showBottomSheet() {
    bottomSheetKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        notchMargin: 4.0,
        child: Container(
          height: 160.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.0),
                topRight: Radius.circular(14.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text(
                  'BottomSheet',
                  style: TextStyle(color: Colors.white, fontSize: 32.0),
                  textAlign: TextAlign.center,
                ),
              ),

              Divider(
                color: Colors.white,
              ),
              Text(
                'BottomSheetOption A',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Divider(
                color: Colors.white,
              ),
              Text(
                'BottomSheetOption B',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.start,
              ),
              Divider(
                color: Colors.white,
              ),
              Text(
                'BottomSheetOption C',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.start,
              ),
//              Divider(color: Colors.white,),
            ],
          ),
        ),
      );
    });
  }

  // 显示后不可进行其他操作
  Future showModalBottomSheets() async {
    final modal = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 180.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, 'Modal C');
                  },
                ),
              ],
            ),
          );
        });
    Fluttertoast.showToast(msg: modal);
  }

  // 显示不了
  showSnackBar() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SnackBar(
            content: Text('SnackBar'),
            action: SnackBarAction(label: 'Ok', onPressed: () {}),
          );
        });
  }

  bool _isExpended = false;

  Widget showPanel() {
    return ExpansionPanelList(
      expansionCallback: (int panelIndex, bool isExpanded) {
        setState(() {
          _isExpended = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'expansion a',
                  style: Theme.of(context).textTheme.title,
                ),
              );
            },
            body: Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'expansion content',
              ),
            ),
            isExpanded: _isExpended),
      ],
    );
  }

  /// applicationName: '标题',
  //  applicationIcon: Icon(Icons.add),
  //  applicationVersion: '1.0.0', //版本号，默认为空
  //  applicationLegalese: '版权所有：刘成',
  //  children: <Widget>[Text("具体的内容"), Text('具体的布局')],

  showAboutAlertDialog() {
    showAboutDialog(
        context: context,
        applicationName: 'AboutDialog',
        applicationIcon: Icon(Icons.settings),
        applicationVersion: '1.0.0',
        applicationLegalese: '@版权是我的',
        children: [
          Text('About dialog Content'),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: bottomSheetKey,
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
          Builder(builder: (BuildContext context) {
            return ListTile(
              title: Text('SnackBar'),
              leading: Icon(
                Icons.sentiment_neutral,
                color: Colors.lightBlue,
              ),
              onTap: () {
//                showSnackBar();
                // SnackBar中使用的context不能是Scaffold中的context，否则SnackBar不显示
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Loading.......'),
                  action: SnackBarAction(
                    label: 'ok',
                    onPressed: () {},
                    textColor: Colors.white,
                  ),
                ));
              },
            );
          }),
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
            onTap: () {
              showAboutAlertDialog();
            },
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          ListTile(
            title: Text('AlertDialog,Your action is $action'),
            leading: Icon(
              Icons.add_alert,
              color: Colors.lightBlue,
            ),
            onTap: () {
              showAlertDialog();
            },
          ),
          Divider(
            height: 10.0,
            color: Colors.lightBlue,
          ),
          ListTile(
            title: Text('SimpleDialog,  your choice is $choices'),
            leading: Icon(
              Icons.settings_input_antenna,
              color: Colors.lightBlue,
            ),
            onTap: () {
              showSimpleDialog();
            },
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
            onTap: () {
              showBottomSheet();
            },
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
            onTap: () {
              showModalBottomSheets();
            },
          ),
        ],
      ),
    );
  }
}
