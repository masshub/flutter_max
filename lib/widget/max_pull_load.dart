import 'package:flutter/material.dart';
import 'package:flutter_max/control/pull_load_control.dart';
import 'package:flutter_max/common/styles/max_icons.dart';
import 'package:flutter_max/common/utils/common_utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///
/// Created by Maker on 2019/2/27.
/// Describe: 下拉加载
///

class MaxPullLoadWidget extends StatefulWidget {
  /// item渲染
  final IndexedWidgetBuilder itemBuilder;

  /// 加载更多回调
  final RefreshCallback onLoadMore;

  /// 下拉刷新回调
  final RefreshCallback onRefresh;

  /// 控制器
  final PullLoadWidgetControl control;

  /// key
  final Key refreshKey;

  MaxPullLoadWidget(
      this.itemBuilder, this.onLoadMore, this.onRefresh, this.control,
      {this.refreshKey});

  @override
  _MaxPullLoadWidgetState createState() => _MaxPullLoadWidgetState(this.control,
      this.itemBuilder, this.onRefresh, this.onLoadMore, this.refreshKey);
}

class _MaxPullLoadWidgetState extends State<MaxPullLoadWidget> {
  /// item渲染
  final IndexedWidgetBuilder itemBuilder;

  /// 加载更多回调
  final RefreshCallback onLoadMore;

  /// 下拉刷新回调
  final RefreshCallback onRefresh;

  /// 控制器
  final PullLoadWidgetControl control;

  /// key
  final Key refreshKey;

  _MaxPullLoadWidgetState(this.control, this.itemBuilder, this.onRefresh,
      this.onLoadMore, this.refreshKey);

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    ///  增加滑动监听
    _scrollController.addListener(() {
      /// 判断当前滑动位置是不是到达底部，到达底部触发加载更多回调
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (this.control.needLoadMore) {
          this.onLoadMore?.call();
        }
      }
    });
    super.initState();
  }

  ///
  /// 根据配置状态返回实际列表数量
  /// 是否需要空白页，是否需要加载更多，均可配置
  ///
  _getListCount() {
    /// 是否需要头部
    if (control.needHeader) {
      /// 需要头部，position = 0 的位置的widget 作为listview头部
      /// 列表数量》0，头部和尾部都需要加载更多，所以加2
      return (control.dataList.length > 0)
          ? control.dataList.length + 2
          : control.dataList.length + 1;
    } else {
      /// 没有数据时，返回1用于空白页的展示
      if (control.dataList.length == 0) {
        return 1;
      }

      /// 有数据，头部需要设置加载更多，列表数+1
      return (control.dataList.length > 0)
          ? control.dataList.length + 1
          : control.dataList.length;
    }
  }

  /// 根据配置状态返回列表渲染item
  _getItem(int index) {
    if (!control.needHeader &&
        index == control.dataList.length &&
        control.dataList.length != 0) {}
  }

  /// 空白页
  Widget _buildEmpty() {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Image(
                image: AssetImage(MaxIcons.DEFAULT_USER_ICON),
                width: 70.0,
                height: 70.0,
              )),
          Container(
            child: Text(
              CommonUtils.getLocale(context).app_empty,
            ),
          ),
        ],
      ),
    );
  }

  // 上拉加载更多
  Widget _buildProgressIndicator() {
    // 是否需要显示上拉加载更多的loading
    Widget bottomWidget = (control.needLoadMore)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 加载动画
              SpinKitCircle(color: Theme.of(context).primaryColor),
              Container(
                width: 50.0,
              ),
              // 加载中文本
              Text(
                CommonUtils.getLocale(context).load_more_text,
                style: TextStyle(
                  color: Color(0xFF121917),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        : Container(); // 不需要加载更多loading
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: bottomWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        // globaKey,用户外部获取RefreshIndicator的state，用于显示刷新
        key: refreshKey,
        // 下拉刷新触发，返回future
        onRefresh: onRefresh,
        child: ListView.builder(
          // 根据状态返回item
          itemBuilder: (context, index) {
            return _getItem(index);
          },
          // 根据状态返回count
          itemCount: _getListCount(),
          // 滑动监听
          controller: _scrollController,
          // 保存ListView在任何情况下都能滑动，解决RefreshIndicator的兼容问题
          physics: const AlwaysScrollableScrollPhysics(),
        ));
  }
}
