import 'package:flutter_deer/bash/base.dart';

import '../service/login_service.dart';

class LoginProvide extends BaseProvide {
  // 页数
  LoginService service = LoginService();

  LoginProvide({this.service});

  String _data = '不一样的点击';

  set info(String t) {
    _data = t;
    notify();
  }

  get info => _data;

  login(var params) {
    start();
    params['password'] = LoginService.Md5(params['password']);
    service.login(
        params: params,
        onError: (code, message) {
          info = '$code,$message';
        },
        onSuccess: (dynamic json) {
          service = LoginService.fromJson(json);
          info = service.toJson().toString();
        });
  }
}
