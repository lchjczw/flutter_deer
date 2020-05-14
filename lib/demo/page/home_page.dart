import 'package:flutter/material.dart';
import 'package:flutter_deer/demo/wiget/i_provide.dart';

import 'file:///F:/project/kcptun/flutter_deer/lib/demo/viewmodel/home/home_provide.dart';
import 'file:///F:/project/kcptun/flutter_deer/lib/demo/viewmodel/home/user_provide.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeContentPage();
  }
}

class HomeContentPage extends State<HomePage> {
  HomeProvide _provide = HomeProvide();
  UserProvide _userProvide = UserProvide();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('home-build(BuildContext context)');

    return Scaffold(
        appBar: AppBar(
          title: Text('演示'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MyConsumer<HomeProvide>(_provide, (context, provide, _) {
                return GestureDetector(
                  onTap: () {
                    print('click2');
                    _loadData();
                  },
                  child: Text(provide.data),
                );
              }),
              MyConsumer<UserProvide>(_userProvide, (context, provide, _) {
                return GestureDetector(
                  onTap: () {
                    print('click3');
                    _loadInfo();
                  },
                  child: Text(provide.info),
                );
              }),
            ],
          ),
        ));
  }

  var params = {
    "password": '12345678',
    "user_name": '18888888888',
    "captcha_code": "string",
    "captcha_id": "homeinfp",
  };

  _loadData() {
    _provide.homeInfo({
      "password": '12345678',
      "user_name": '18888888888',
      "captcha_code": "string",
      "captcha_id": "homeinfp",
    });
  }

  _loadInfo() {
    _userProvide.userUnfo(params);
  }
}
