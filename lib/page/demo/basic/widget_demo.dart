import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

///
/// Created by Maker on 2019/7/16.
/// Description:
///

class WidgetDemo extends StatefulWidget {
  @override
  _WidgetDemoState createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WidgetDemo"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                clipOval(),
                clipRRect(),
                clipRect(),
                pageView(),
                sizeBox(),
                stack(),
                wrap(),
                gesture(),
                Text(msg),
              ],
            ),
            moveBall(),
          ],
        ));
  }

  Widget clipOval() {
    return Container(
      width: 66.0,
      height: 66.0,
      alignment: Alignment.center,
      child: ClipOval(
        child: Image.asset(
          images[11].imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget clipRRect() {
    return Container(
      width: 66.0,
      height: 66.0,
      margin: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        child: Image.asset(
          images[12].imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget clipRect() {
    return Container(
      width: 66.0,
      height: 66.0,
      margin: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      child: ClipRect(
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          images[13].imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget pageView() {
    return Container(
      height: 100.0,
      margin: EdgeInsets.all(10.0),
      child: PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        clipBehavior: Clip.antiAlias,
        child: PageView(
          children: <Widget>[
            pageViewItem("page0", Colors.cyanAccent),
            pageViewItem("page1", Colors.blue),
            pageViewItem("page2", Colors.deepOrangeAccent),
          ],
        ),
      ),
    );
  }

  Widget pageViewItem(String title, Color background) {
    return Container(
      color: background,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }

  Widget sizeBox() {
    return FractionallySizedBox(
      child: Container(
        color: Colors.deepPurple,
        child: Text(
          "sizebox",
          style: TextStyle(color: Colors.white),
        ),
      ),
      widthFactor: 1.0,
    );
  }

  Widget stack() {
    return Stack(
      children: <Widget>[
        Image.asset(images[14].imageUrl),
        Positioned(
          child: Image.asset(
            images[14].imageUrl,
            width: 80.0,
            height: 80.0,
          ),
          left: 10.0,
          top: 10.0,
        ),
      ],
    );
  }

  Widget wrap() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: <Widget>[
        chip("label0", Colors.indigoAccent),
        chip("label1", Colors.amberAccent),
        chip("label2", Colors.cyan),
        chip("label3", Colors.lightGreenAccent),
        chip("label4", Colors.purpleAccent),
      ],
    );
  }

  Widget chip(String label, Color color) {
    return ChoiceChip(
      label: Text(label),
      labelStyle: TextStyle(fontSize: 14.0, color: Colors.white),
      labelPadding: EdgeInsets.only(left: 16.0, right: 16.0),
      backgroundColor: color,
      selectedColor: Colors.red,
      onSelected: (value) {},
      selected: label == "label0",
      avatar: CircleAvatar(
        child: Icon(
          Icons.ac_unit,
          color: Colors.white,
          size: 22.0,
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget gesture() {
    return GestureDetector(
      onTap: () => clickMsg("点击"),
      onLongPress: () => clickMsg("长按"),
      onDoubleTap: () => clickMsg("双击"),
//      onPanCancel: () => print("取消"),
      onTapCancel: () => clickMsg("取消"),
      onTapDown: (c) => clickMsg("按下"),
      onTapUp: (c) => clickMsg("松开"),
      child: Container(
        child: Text("点击事件"),
        color: Colors.yellow,
        width: 100.0,
        height: 60.0,
      ),
    );
  }

  String msg = "";

  clickMsg(String message) {
    msg += message + ",";
    setState(() {});
  }

  double moveX = 0.0;
  double moveY = 0.0;

  Widget moveBall() {
    return Positioned(
        left: moveX,
        top: moveY,
        child: GestureDetector(
          onPanUpdate: (e) {
            setState(() {
              moveX = e.globalPosition.dx - 16.0;
              moveY = e.globalPosition.dy - 86.0;
            });
          },
          child: Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(16.0)
            ),
          ),
        ));

  }
}
