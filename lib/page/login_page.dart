import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///
/// Created by Maker on 2019/1/11.
/// Describe:登陆
///

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();
  String account, password;
  bool autoValidate = false;

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
    return null;
  }

  void _saveLoginInformation() {

    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      debugPrint('account : $account');
      debugPrint('password : $password');
      if (account == 'max' && password == '123456') {
        Navigator.pushNamed(context, '/');
      } else {}
    } else {
      setState(() {
        autoValidate = true;
      });
    }
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
                            onEditingComplete: () =>
                                FocusScope.of(context).requestFocus(secondTextFieldNode),
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
                            cursorColor: Colors.lightBlueAccent,
                            cursorRadius: Radius.circular(16.0),
                            cursorWidth: 16.0,
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
                            color: Colors.deepOrange,
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
            SpinKitCircle(color: Colors.deepOrange),
          ],
        ),
      ),
    );
  }
}
