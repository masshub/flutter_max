import 'package:flutter/material.dart';
import 'package:flutter_max/common/config/config.dart';
import 'package:flutter_max/control/pull_load_control.dart';
import 'dart:async';

///
/// Created by Maker on 2019/2/27.
/// Describe: 上拉，下拉刷新列表通用State
///

mixin MaxListState<T extends StatefulWidget>
    on State<T>, AutomaticKeepAliveClientMixin<T> {
  bool isShow = false;
  bool isLoading = false;
  int page = 1;

  final List dataList = List();
  final PullLoadWidgetControl pullLoadWidgetControl = PullLoadWidgetControl();
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  showRefreshLoading() {
    Future.delayed(const Duration(seconds: 0), () {
      refreshIndicatorKey.currentState.show().then((e) {});
      return true;
    });
  }

  @protected
  resolveRefreshResult(res) {
    if (res != null && res.result) {
      pullLoadWidgetControl.dataList.clear();
      if (isShow) {
        setState(() {
          pullLoadWidgetControl.dataList.addAll(res.data);
        });
      }
    }
  }

  @protected
  Future<Null> handleRefresh() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page = 1;
    var res = await requestRefrersh();
    resolveRefreshResult(res);
    resolveDataResult(res);
    if (res.next != null) {
      var resNext = await res.next;
      resolveRefreshResult(resNext);
      resolveDataResult(resNext);
    }
    isLoading = false;
    return null;
  }

  @protected
  Future<Null> onLoadMore() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page++;
    var res = await requestLoadMore();
    if (res != null && res.result) {
      if (isShow) {
        setState(() {
          pullLoadWidgetControl.dataList.addAll(res.data);
        });
      }
    }
    resolveDataResult(res);
    isLoading = false;
    return null;
  }



  @override
  void initState() {
    isShow = true;
    super.initState();
    pullLoadWidgetControl.needHeader = needHeader;
    pullLoadWidgetControl.dataList = getDataList;
    if (pullLoadWidgetControl.dataList.length == 0 && isRefreshFirst) {
      showRefreshLoading();
    }
  }

  @override
  void dispose() {
    isShow = false;
    isLoading = false;
    super.dispose();
  }

  @protected
  resolveDataResult(res) {
    if (isShow) {
      setState(() {
        pullLoadWidgetControl.needLoadMore = (res != null &&
            res.data != null &&
            res.data.length == Config.PAGE_SIZE);
      });
    }
  }

  @protected
  clearData() {
    if (isShow) {
      setState(() {
        pullLoadWidgetControl.dataList.clear();
      });
    }
  }

  // 下拉刷新数据
  @protected
  requestRefrersh() async {}

  ///上拉更多请求数据
  @protected
  requestLoadMore() async {}

  ///是否需要第一次进入自动刷新
  @protected
  bool get isRefreshFirst;

  ///是否需要头部
  @protected
  bool get needHeader => false;

  ///是否需要保持
  @override
  bool get wantKeepAlive => true;

  List get getDataList => dataList;
}
