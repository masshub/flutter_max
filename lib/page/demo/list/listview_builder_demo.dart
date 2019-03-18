import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * Created by Maker on 2019/3/14.
 * Describe:
 *   //设置滑动方向 Axis.horizontal 水平  默认 Axis.vertical 垂直
    scrollDirection: Axis.vertical,
    //内间距
    padding: EdgeInsets.all(10.0),
    //是否倒序显示 默认正序 false  倒序true
    reverse: false,
    //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
    primary: true,
    //确定每一个item的高度 会让item加载更加高效
    itemExtent: 50.0,
    //内容适配
    shrinkWrap: true,
    //item 数量
    itemCount: list.length,
    //滑动类型设置
    physics: new ClampingScrollPhysics(),
    //cacheExtent  设置预加载的区域
    cacheExtent: 30.0,
    //滑动监听
    //        controller
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
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(4.0)),
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
