import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

/**
 * Created by Maker on 2019/3/18.
 * Describe:
 */

class Containers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Container'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 166.0,
          height: 166.0,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            border: Border(
              top: BorderSide(
                color: Colors.red,
                width: 4.0,
                style: BorderStyle.solid,
              ),
              left: BorderSide(
                color: Colors.blue,
                width: 4.0,
                style: BorderStyle.solid,
              ),
              bottom: BorderSide(
                color: Colors.yellow,
                width: 4.0,
                style: BorderStyle.solid,
              ),
              right: BorderSide(
                color: Colors.greenAccent,
                width: 4.0,
                style: BorderStyle.solid,
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
//          borderRadius: BorderRadius.only(
//            topLeft: Radius.circular(1.0),
//            topRight: Radius.circular(4.0),
//            bottomLeft: Radius.circular(6.0),
//            bottomRight: Radius.circular(8.0),
//          ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(10.0, 10.0),
                  color: Color.fromRGBO(123, 124, 255, 0.5),
                  blurRadius: 16.0,
                  spreadRadius: 10.0),
              BoxShadow(
                  offset: Offset(-10.0, -10.0),
                  color: Color.fromRGBO(251, 124, 255, 0.5),
                  blurRadius: 16.0,
                  spreadRadius: 10.0),
              BoxShadow(
                  offset: Offset(-10.0, 10.0),
                  color: Color.fromRGBO(123, 222, 115, 0.5),
                  blurRadius: 16.0,
                  spreadRadius: 10.0),
              BoxShadow(
                  offset: Offset(10.0, -10.0),
                  color: Color.fromRGBO(12, 124, 55, 0.5),
                  blurRadius: 16.0,
                  spreadRadius: 10.0),
            ],
            shape: BoxShape.rectangle,
//            gradient: RadialGradient(colors: [
//              Colors.lightBlueAccent,
//              Colors.blue,
//              Colors.yellow,
//            ]),
            gradient: LinearGradient(colors: [
              Colors.lightBlueAccent,
              Colors.blue,
              Colors.yellow,
            ], begin: Alignment.center, end: Alignment.bottomRight),
            image: DecorationImage(image: AssetImage(images[0].imageUrl),fit: BoxFit.fill,colorFilter: ColorFilter.mode(Colors.black, BlendMode.softLight)),
          ),
          child: Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
            size: 111.0,
          ),
        ),
      ),
    );
  }
}
