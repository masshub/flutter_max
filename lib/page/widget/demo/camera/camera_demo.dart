import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///
/// Created by Maker on 2019/7/16.
/// Description:
/// 

class CameraDemo extends StatefulWidget {
  @override
  _CameraDemoState createState() => _CameraDemoState();
}

class _CameraDemoState extends State<CameraDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CameraDemo"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GestureDetector(
          onTap: () {
            showBottomSheet();
          },
          child: Container(
            height: 100.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(6.0),
              image: DecorationImage(image: FileImage(_imageFile ?? File("")))
            ),
            child: Text(
              "Image", style: TextStyle(color: Colors.white, fontSize: 14.0),),
          )
      ),
    );
  }



  void showBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)
    {
      return Container(
        height: 112.0,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () {
                open(true);
              },
            ),

            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Gallery"),
              onTap: () {
                open(false);
              },
            )

          ],
        ),
      );
    });
  }

  var _imageFile;
  open(bool camera) async{
    Navigator.of(context).pop();
    _imageFile = await ImagePicker.pickImage(source: camera? ImageSource.camera :ImageSource.gallery);
    setState(() {
    });
}


}

