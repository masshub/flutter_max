import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
/**
 * Created by Maker on 2019/3/27.
 * Describe:
 */

class RefreshAndLoad extends StatefulWidget {
  @override
  _RefreshAndLoadState createState() => _RefreshAndLoadState();
}

class _RefreshAndLoadState extends State<RefreshAndLoad> {
  List<String> images;
  ScrollController controller;

  @override
  void initState() {
    super.initState();
    images = List<String>();
    controller = ScrollController();

    fetchMore();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        fetchMore();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Loading & Refresh'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RefreshIndicator(
          child: ListView.builder(
              controller: controller,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: Card(

                      child:Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ));
              }),
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            images.clear();
            fetchMore();
          }),
    );
  }

  void fetchMore() {
    for (int i = 0; i < 10; i++) {
      fetch();
    }
  }

  void fetch() async {
    final response = await http.get('http://dog.ceo/api/breeds/image/random');
    if (response.statusCode == 200) {
      setState(() {
        images.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('Failed to load images');
    }
  }
}
