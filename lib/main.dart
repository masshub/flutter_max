import 'package:flutter/material.dart';
import 'package:flutter_max/page/home_page.dart';
import 'package:flutter_max/page/login_page.dart';
import 'package:flutter_max/page/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Max',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => HomePage(title: 'Home'),
        '/splash': (context) => Splash(),
        '/login': (context) => Login(),
      },
    );
  }
}
