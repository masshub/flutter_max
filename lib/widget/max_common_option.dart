import 'package:flutter/material.dart';
import 'package:flutter_max/common/utils/common_utils.dart';
import 'package:flutter_max/control/option_control.dart';
import 'package:flutter_max/model/option_model.dart';
import 'package:share/share.dart';

///
/// Created by Maker on 2019/2/27.
/// Describe:
///

class MaxCommonOption extends StatelessWidget {
  final List<MaxCommonOptionModel> otherList;

  final OptionControl control;

  MaxCommonOption(this.control,{this.otherList});

  _headerPopItem(List<MaxCommonOptionModel> list) {
    return PopupMenuButton<MaxCommonOptionModel>(
      child: Icon(Icons.more),
      onSelected: (model) {
        model.selected(model);
      },
      itemBuilder: (BuildContext context) {
        return _headerPopItemChild(list);
      },
    );
  }

  _headerPopItemChild(List<MaxCommonOptionModel> data) {
    List<PopupMenuEntry<MaxCommonOptionModel>> list = List();
    for (MaxCommonOptionModel item in data) {
      list.add(PopupMenuItem<MaxCommonOptionModel>(
        value: item,
        child: Text(item.name),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<MaxCommonOptionModel> list = [
      MaxCommonOptionModel(CommonUtils.getLocale(context).option_web,
          CommonUtils.getLocale(context).option_web, (model) {
        CommonUtils.launchOutUrl(context, control.url);
      }),
      MaxCommonOptionModel(CommonUtils.getLocale(context).option_copy,
          CommonUtils.getLocale(context).option_copy, (model) {
        CommonUtils.copy(context, control.url ?? "");
      }),
      MaxCommonOptionModel(CommonUtils.getLocale(context).option_share,
          CommonUtils.getLocale(context).option_share, (model) {
        Share.share(
            CommonUtils.getLocale(context).option_share_title + control.url ??
                "");
      }),
    ];

    if (otherList != null && otherList.length > 0) {
      list.addAll(otherList);
    }

    return _headerPopItem(list);
  }
}
