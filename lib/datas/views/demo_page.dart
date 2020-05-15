import 'package:flutter/material.dart';
import 'package:flutter_deer/base/base.dart';
import 'package:flutter_deer/base/i_provide.dart';
import 'package:flutter_deer/datas/viewmodels/demo_provide.dart';
import 'package:flutter_deer/datas/viewmodels/login_provide.dart';
import 'package:flutter_deer/widgets/app_bar.dart';
import 'package:flutter_deer/widgets/my_scroll_view.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> implements BasePage {
  LoginProvide loginProvide = LoginProvide();
  DemoProvide demoProvide = DemoProvide();

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
        actionName: '',
        onPressed: () {},
      ),
      body: MyScrollView(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        children: _buildBody,
      ),
    );
  }

  get _buildBody => [
        FlatButton(onPressed: () => demoProvide.query(), child: Text('query')),
        FlatButton(onPressed: () => demoProvide.get(), child: Text('get')),
        FlatButton(onPressed: () => demoProvide.post(), child: Text('post')),
        FlatButton(
            onPressed: () => demoProvide.update(), child: Text('update')),
        FlatButton(
            onPressed: () => demoProvide.delete(), child: Text('delete')),
        FlatButton(
            onPressed: () => demoProvide.enable(), child: Text('enable')),
        FlatButton(
            onPressed: () => demoProvide.disable(), child: Text('disable')),
        MyConsumer<DemoProvide>(demoProvide, (_, demoProvide, child) {
          return Text(demoProvide?.msg ?? "点击请求显示数据");
        })
      ];

  @override
  initProvide() {
    // 等待页面渲染完成,初始化provide
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginProvide.context = context;
      demoProvide.context = context;
    });
  }
}
