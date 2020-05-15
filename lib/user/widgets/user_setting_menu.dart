import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_deer/res/resources.dart';
import 'package:flutter_deer/setting/widgets/exit_dialog.dart';
import 'package:flutter_deer/setting/widgets/update_dialog.dart';
import 'package:flutter_deer/widgets/click_item.dart';

/// design/8设置/index.html
class UserSettingMenu extends StatefulWidget {
  @override
  _UserSettingMenuState createState() => _UserSettingMenuState();
}

class _UserSettingMenuState extends State<UserSettingMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Gaps.vGap5,
        ClickItem(title: '清除缓存', content: '23.5MB', onTap: () {}),
        ClickItem(title: '检查更新', onTap: () => _showUpdateDialog()),
//        ClickItem(
//            title: '关于我们',
//            onTap: () => NavigatorUtils.push(context, SettingRouter.aboutPage)),
        ClickItem(
          title: '退出',
          onTap: () => exit(0),
        ),
      ],
    );
  }

  void _showExitDialog() {
    showDialog(context: context, builder: (_) => ExitDialog());
  }

  void _showUpdateDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => UpdateDialog());
  }
}
