import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/2/27.
 * Describe: 网络错误事件
 */

class HttpErrorEvent{
  final int code;
  final String message;
  HttpErrorEvent(this.code,this.message);

}