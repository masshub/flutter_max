import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///
/// Created by Maker on 2019/7/22.
/// Description:
///

class DistanceNotification extends StatefulWidget {
  @override
  _DistanceNotificationState createState() => _DistanceNotificationState();
}

class _DistanceNotificationState extends State<DistanceNotification> {
  static const scrollDistance = 80.0;
  List<String> _imageUrls = [
    "https://resources.ninghao.net/images/childhood-in-a-picture.jpg",
    "https://resources.ninghao.net/images/contained.jpg",
    "https://resources.ninghao.net/images/dragon.jpg",
    "https://resources.ninghao.net/images/free_hugs.jpg",
    "https://resources.ninghao.net/images/gravity-falls.png"
  ];

  double distance = 0.0;
  double opacity = 0.0;

  void scroll(ScrollNotification scrollNotification){
    distance = scrollNotification.metrics.pixels;
    double alpha = distance / scrollDistance;
    if(alpha <= 0){
      alpha = 0;
    } else if(alpha >= 1){
      alpha = 1;
    }
    opacity = alpha;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
        MediaQuery.removePadding(
        context: context,
            removeTop: true,
            child: NotificationListener(
                onNotification: (scrollNotification){
                  if(scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0){
                    scroll(scrollNotification);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (context, index) {
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 800.0,
                      alignment: FractionalOffset.center,
                      child: ListTile(
                        title: Text("$distance"),
                      ),
                    )
                  ],
                ))),

            Opacity(opacity: opacity,
            child: Container(
              height: 80.0,
              color: Colors.white,
              child: Center(
                child: Padding(padding: EdgeInsets.only(top: 10.0),
                child: Text("This is a AppBar"),),
              ),
            ),)

          ],

    ));
  }
}
