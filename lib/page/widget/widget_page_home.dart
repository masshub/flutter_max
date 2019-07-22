import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';
import 'package:flutter_max/common/utils/navigator_utils.dart';

/**
 * Created by Maker on 2019/3/13.
 * Describe:
 */

class WidgetPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * 可以传入SliverGridDelegateWithFixedCrossAxisCount对象和SliverGridDelegateWithMaxCrossAxisExtent对象。
        其中SliverGridDelegateWithFixedCrossAxisCount可以直接指定每行（列）显示多少个Item，
        SliverGridDelegateWithMaxCrossAxisExtent会根据GridView的宽度和你设置的每个的宽度来自动计算没行显示多少个Item
     */
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
      children: <Widget>[
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[20].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              )),
          onTap: () {
            NavigatorUtils.showLogin(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[11].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'WebView',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              )),
          onTap: () {
            NavigatorUtils.showWebView(context, 'https://www.baidu.com/', '百度');
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[22].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'Splash&高斯模糊&贝塞尔曲线',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
          onTap: () {
            NavigatorUtils.showSplash(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[23].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              )),
          onTap: () {
            NavigatorUtils.showSearch(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[24].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'Route',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
              )),
          onTap: () {
            NavigatorUtils.showRoute(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[25].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'ReFresh&Loading',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
              )),
          onTap: () {
            NavigatorUtils.showLoadAndRefresh(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[26].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'Sliver',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              )),
          onTap: () {
            NavigatorUtils.showSliver(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[27].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'Dialog&Toast',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
              )),
          onTap: () {
            NavigatorUtils.showDialogAndToast(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[28].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'RecordableListView',
                  style: TextStyle(color: Colors.white, fontSize: 22.0,),
                  textAlign: TextAlign.center,
                ),
              )),
          onTap: () {
            NavigatorUtils.showRecordableListView(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[29].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'Animation',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              )),
          onTap: () {
            NavigatorUtils.showAnimation(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[30].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'Camera',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              )),
          onTap: () {
            NavigatorUtils.showCameraDemo(context);
          },
        ),
        InkWell(
          child: Container(
              margin: EdgeInsets.all(6.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: AssetImage(
                      images[31].imageUrl,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  'Demo',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              )),
          onTap: () {},
        ),
      ],
    );
  }
}
