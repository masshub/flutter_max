import 'package:flutter/material.dart';
import 'package:flutter_max/common/styles/max_images.dart';

/**
 * Created by Maker on 2019/3/27.
 * Describe:
 */

class SliverDemo extends StatefulWidget {
  @override
  _SliverDemoState createState() => _SliverDemoState();
}

class _SliverDemoState extends State<SliverDemo> {
  ScrollController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController();
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
      body: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          _sliverAppBar(),
          _sliverToBoxAdapter(),
          _sliverGrid(context),
          _sliverFixExtentList(context),
          _sliverFillViewport(),
        ],
      ),
    );
  }

  ///
  ///  Key key,
  //    this.leading,         //左侧标题,在标题前面显示的一个控件
  //    this.automaticallyImplyLeading = true,
  //    this.title,               //标题,Toolbar 中主要内容，通常显示为当前界面的标题文字
  //    this.actions,          //菜单m一个 Widget 列表，代表 Toolbar 中所显示的菜单，
  //    this.flexibleSpace,        //可以展开区域，通常是一个FlexibleSpaceBar,
  //    this.bottom,         //底部内容区域,一个 AppBarBottomWidget 对象，
  //    this.elevation,            //阴影,
  //    this.forceElevated = false,
  //    this.backgroundColor,       //背景色
  //    this.brightness,   /主题明亮
  //    this.iconTheme,  //图标主题
  //    this.textTheme,    //文字主题
  //    this.primary = true,  //是否预留高度
  //    this.centerTitle,     //标题是否居中
  //    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
  //    this.expandedHeight,     //展开高度
  //    this.floating = false,       //是否随着滑动隐藏标题
  //    this.pinned = false,  //是否固定在顶部
  //    this.snap = false,   //与floating结合使用

  ///leading：在标题前面显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮
  //title： Toolbar 中主要内容，通常显示为当前界面的标题文字
  //actions：一个 Widget 列表，代表 Toolbar 中所显示的菜单，对于常用的菜单，通常使用 IconButton 来表示；
  // 对于不常用的菜单通常使用 PopupMenuButton 来显示为三个点，点击后弹出二级菜单
  //bottom：一个 AppBarBottomWidget 对象，通常是 TabBar。用来在 Toolbar 标题下面显示一个 Tab 导航栏
  //elevation：纸墨设计中控件的 z 坐标顺序，默认值为 4，对于可滚动的 SliverAppBar，当 SliverAppBar
  // 和内容同级的时候，该值为 0， 当内容滚动 SliverAppBar 变为 Toolbar 的时候，修改 elevation 的值
  //flexibleSpace：一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果，该属性通常在 SliverAppBar 中使用
  //backgroundColor：APP bar 的颜色，默认值为 ThemeData.primaryColor。改值通常和下面的三个属性一起使用
  //brightness：App bar 的亮度，有白色和黑色两种主题，默认值为 ThemeData.primaryColorBrightness
  //iconTheme：App bar 上图标的颜色、透明度、和尺寸信息。默认值为 ThemeData.primaryIconTheme
  //textTheme： App bar 上的文字样式。默认值为 ThemeData.primaryTextTheme
  //centerTitle： 标题是否居中显示，默认值根据不同的操作系统，显示方式不一样
  ///
  Widget _sliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white.withOpacity(0.7),
      expandedHeight: 200.0,
      pinned: true,
//      floating: true,
//      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text('Sliver'),
        background: Image.asset(
          images[0].imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _sliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Container(
        height: 111.0,
        color: Colors.cyan,
        child: Center(
          child: Text(
            'SliverToBoxAdapter',
            style: TextStyle(color: Colors.white, fontSize: 26.0),
          ),
        ),
      ),
    );
  }

  Widget _sliverGrid(BuildContext context) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 222.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0),
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 10)],
            child: Image.asset(
              images[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        }, childCount: images.length - 16));
  }

  Widget _sliverFixExtentList(BuildContext context) {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 10)],
            child: Image.asset(
              images[index + 15].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        }, childCount: images.length - 15),
        itemExtent: 50.0);
  }

  Widget _sliverFillViewport() {
    return SliverFillViewport(
      delegate: SliverChildListDelegate([
        Container(
          height: 111.0,
          color: Colors.redAccent.withOpacity(0.6),
          child: Center(
            child: Text(
              'SliverFillViewport',
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
          ),
        )
      ]),
      viewportFraction: 1.0,
    );
  }
}
