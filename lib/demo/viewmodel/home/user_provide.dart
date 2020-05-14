import 'package:flutter_deer/bash/base.dart';
import 'package:flutter_deer/demo/models/model/base/Login.dart';

class UserProvide extends BaseProvide {
  // 页数

  String _data = '不一样的点击';

  set info(String t) {
    _data = t;
    notify();
  }

  get info => _data;

  userUnfo(var params) {
    start();
    LoginInfoBase loginInfo = LoginInfoBase();
    params['password'] = LoginInfoBase.Md5(params['password']);
    loginInfo.login(
        params: params,
        onError: (code, message) {
          info = '$code,$message';
        },
        onSuccess: (dynamic base) {
          LoginInfoBase d = LoginInfoBase.fromJson(base);
          info = d.toJson().toString();
        });
  }
}
