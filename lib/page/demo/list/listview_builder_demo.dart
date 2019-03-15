import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
 */

class ListViewBuilder extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Card(
      elevation: 6.0,
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        leading: Container(
          height: 66.0,
          width: 76.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    images[index].imageUrl,
                  ),
                  fit: BoxFit.cover,),
              borderRadius:BorderRadius.circular(4.0)),
        ),
        title: Text(
          images[index].title,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.format_list_numbered,
          color: Colors.white,
        ),
        onTap: () {
          Fluttertoast.showToast(msg: "Don't Touch Me");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewBuilder'),
      ),
      body: ListView.builder(
        itemBuilder: _listItemBuilder,
        itemCount: images.length - 10,
//        itemExtent: 80.0,
      ),
    );
  }
}
