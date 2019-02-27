import 'package:flutter/material.dart';

///
/// Created by Maker on 2019/2/27.

class MaxCommonOptionModel {
  final String name;
  final String value;
  final PopupMenuItemSelected<MaxCommonOptionModel> selected;

  MaxCommonOptionModel(this.name, this.value, this.selected);
}
