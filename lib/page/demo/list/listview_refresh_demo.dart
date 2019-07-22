import 'package:flutter/material.dart';

///
/// Created by Maker on 2019/7/22.
/// Description:
///

class ListViewRefresh extends StatefulWidget {
  @override
  _ListViewRefreshState createState() => _ListViewRefreshState();
}

class _ListViewRefreshState extends State<ListViewRefresh> {
  List<int> data = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26
  ];
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener((){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      _loadData();
    }
  });
    super.initState();

  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListViewRefresh"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: RefreshIndicator(
          child: ListView(
            controller: scrollController,
              children: data
                  .map(
                    (value) => _item(value),
                  )
                  .toList()),
              onRefresh: _handleRefresh),
        );
  }

 Widget _item(int value) {
    return Container(
      height: 50,
      color: Colors.lightBlueAccent,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10.0),
      child: Text("$value",style: TextStyle(color: Colors.white,fontSize: 20.0),),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      data = data.reversed.toList();
    });
    return null;
  }

  _loadData() async {
    await Future.delayed(Duration(microseconds: 500));
    setState(() {
      List<int> list = List<int>.from(data);
      list.addAll(data);
      data = list;

    });
  }
}
