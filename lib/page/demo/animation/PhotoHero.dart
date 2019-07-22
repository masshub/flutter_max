import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show  timeDilation;

///
/// Created by Maker on 2019/7/18.
/// Description:
/// 

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;


  PhotoHero({this.photo, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(tag: photo, child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Image.network(photo,fit: BoxFit.contain,),

        ),

      )),
    );
  }
}

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Hero Animation"),
      ),
      body: Center(
        child: PhotoHero(
          photo: "https://resources.ninghao.net/images/candy-shop.jpg",
          width: 300.0,
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Scaffold(
                appBar: AppBar(
                  title: Text("Flippers Page"),
                ),
                body: Container(
                  color: Colors.lightBlueAccent,
                  child: PhotoHero(
                    photo: "https://resources.ninghao.net/images/candy-shop.jpg",
                    width: 100,
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

