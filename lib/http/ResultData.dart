import 'package:flutter/material.dart';

/**
 * Created by Maker on 2019/2/27.
 * Describe: 返回数据
 */

class ResultData{
  var data;
  bool result;
  int code;
  var headers;


  ResultData(this.data,this.result,this.code,{this.headers});

}