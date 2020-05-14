import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:flutter_deer/base/base.dart';
import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/datas/services/login_service.dart';

class LoginProvide extends BaseProvide {
  // 页数
  LoginService service;

  LoginProvide() {
    service = LoginService();
  }

  login(var name, var pass, call(bool ok)) {
    start(msg: '开始登录');
    FlutterStars.SpUtil.putString(Constant.phone, name);

    var params = {
      "password": LoginService.Md5(pass),
      "user_name": name,
      "captcha_code": "string",
      "captcha_id": "homeinfp",
    };

    service?.login(
        params: params,
        onError: (code, message) {
          call(false);
          end(msg: message);
        },
        onSuccess: (dynamic json) {
          service = LoginService.fromJson(json);
          FlutterStars.SpUtil.putString(
              Constant.accessToken, service.model.accessToken);
          call(true);
          end(msg: '登录成功');
        });
  }
}
