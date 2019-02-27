import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

///
/// Created by Maker on 2019/1/11.
/// Describe:登陆
///

class Login extends StatefulWidget {
  static final String mName = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();
  String account, password;
  bool autoValidate = false;
  Color loginColor = Colors.grey[400];

  String _validatorAccount(String value) {
    if (value.isEmpty) {
      return '手机号码不能为空';
    }
    return null;
  }

  String _validatorPassword(String value) {
    if (value.isEmpty) {
      return '密码不能为空';
    }

    if (value.length == 6) {
      setState(() {
        loginColor = Colors.deepOrange;
      });
    }
    return null;
  }

  void _saveLoginInformation() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new Material(
              color: Colors.transparent,
              child: WillPopScope(
                onWillPop: () => new Future.value(false),
                child: Center(
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    padding: new EdgeInsets.all(4.0),
                    decoration: new BoxDecoration(
                      color: Colors.transparent,
                      //用一个BoxDecoration装饰器提供背景图片
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                            child: SpinKitCircle(
                          color: Colors.lightBlueAccent,
                          size: 70.0,
                        )),
                      ],
                    ),
                  ),
                ),
              ));
        });


    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      debugPrint('account : $account');
      debugPrint('password : $password');
      if (account == 'max' && password == '123456') {
        Timer(Duration(seconds: 1), _event ); //关闭对话框

      } else {}
    } else {
      setState(() {
        autoValidate = true;
      });
    }
  }
  void _event() {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/');
  }

  TextEditingController _accountController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _clearAccount() {
    _accountController.clear();
  }

  void _clearPassword() {
    _passwordController.clear();
  }

  FocusNode secondTextFieldNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Container(
        color: Colors.lightBlueAccent,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/logo.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 300.0,
              child: Card(
                color: Colors.white,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                margin: EdgeInsets.only(right: 46.0, left: 46.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          TextFormField(
                            controller: _accountController,
                            keyboardType: TextInputType.phone,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(secondTextFieldNode),
                            maxLength: 11,
                            maxLines: 1,
                            decoration: InputDecoration(
                              labelText: '手机号码',
                              labelStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                              hintText: '请输入手机号码',
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Colors.grey[400]),
                              helperText: '',
                              contentPadding:
                                  EdgeInsets.only(top: 26.0, bottom: 4.0),
                            ),
                            autovalidate: autoValidate,
                            onSaved: (value) {
                              account = value;
                            },
                            validator: _validatorAccount,
                          ),
                          IconButton(
                              onPressed: _clearAccount,
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.grey[400],
                              )),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          TextFormField(
                            controller: _passwordController,
                            focusNode: secondTextFieldNode,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: InputDecoration(
                              labelText: '密码',
                              labelStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                              hintText: '请输入密码',
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Colors.grey[400]),
                              helperText: '',
                              contentPadding:
                                  EdgeInsets.only(top: 6.0, bottom: 10.0),
                            ),
                            autovalidate: autoValidate,
                            obscureText: true,
                            validator: _validatorPassword,
                            onSaved: (value) {
                              password = value;
                            },
                          ),
                          IconButton(
                              onPressed: _clearPassword,
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.grey[400],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                            color: MaxColors.primarySwatch,
                            disabledColor: loginColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0))),
                            child: Text(
                              '登陆',
                              style: TextStyle(color: Colors.white),
                            ),
                            elevation: 0.0,
                            onPressed: () {
                              _saveLoginInformation();
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
