import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

/**
 * Created by Maker on 2019/3/26.
 * Describe:
 */

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
//    fetchPost().then((value) => print(value));
//    final post = {
//      'title': 'title',
//      'description': 'description',
//    };
//
//    print(post['title']);
//    print(post['description']);
//    final postJson = json.encode(post);
//    print(postJson);
//
//    final postJsonConverted = json.decode(postJson);
//    print(postJsonConverted['title']);
//    print(postJsonConverted['description']);
//    print(postJsonConverted is Map);
//
//    final postModel = Post.fromJson(postJsonConverted);
//    print('title: ${postModel.title}');
//    print('description: ${postModel.description}');

//    print('${json.encode(postModel)}');
  }

  Future<List<Post>> fetchPost() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');

    if (response.statusCode == 200) {
      final resposeBody = json.decode(response.body);
      List<Post> posts = resposeBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();


      return posts;
    } else {
      throw Exception('Failed to fetch posts.');
    }
//    print('statusCode: ${response.statusCode}');
//    print('body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('data:${snapshot.data}');
          print('connectionState: ${snapshot.connectionState}');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('加载中...... '),
            );
          }
          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
              );
            }).toList(),
          );
        });
  }
}

class Post {
  final String title;
  final String description;
  final int id;
  final String author;
  final String imageUrl;

  Post(this.title, this.description, this.imageUrl, this.id, this.author);
  Post.fromJson(Map json)
      : title = json['title'],
        description = json['description'],
        id = json['id'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {'title': title, 'description': description};
}
