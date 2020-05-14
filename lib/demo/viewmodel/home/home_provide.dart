import 'package:flutter_deer/bash/base.dart';
import 'package:flutter_deer/demo/models/model/base/Login.dart';

class HomeProvide extends BaseProvide {
  // 页数

  String _data = '点击';

  set data(String t) {
    _data = t;
    notify();
  }

  get data => _data;

  homeInfo(var params) {
    start();
    LoginInfoBase loginInfo = LoginInfoBase();
    params['password'] = LoginInfoBase.Md5(params['password']);

    loginInfo.login(
        params: params,
        onError: (code, message) {
          data = '$code,$message';
        },
        onSuccess: (dynamic base) {
          LoginInfoBase d = LoginInfoBase.fromJson(base);
          data = d.toJson().toString();
        });
  }
}
