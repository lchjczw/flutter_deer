import 'package:flutter/material.dart';
import 'package:flutter_deer/base/base.dart';
import 'package:flutter_deer/datas/views/test_router.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flutter_deer/widgets/my_scroll_view.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> implements BasePage {
  @override
  void initState() {
    super.initState();
    initProvide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        actionName: '验证码登录',
        onPressed: () {},
      ),
      body: MyScrollView(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        children: _buildBody,
      ),
    );
  }

  get _buildBody => [
        FlatButton(
            onPressed: () => NavigatorUtils.push(context, TestRouter.demoPage),
            child: Text('demo示例')),
      ];

  @override
  initProvide() {
    // 等待页面渲染完成,初始化provide
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }
}
