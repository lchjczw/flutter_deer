import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/datas/base/base.dart';
import 'package:flutter_deer/datas/services/login_service.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/user/user_router.dart';

class LoginProvide extends BaseProvide {
  // 页数
  LoginService service = LoginService();

  login(var name, var pass) {
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
          end(msg: message);
        },
        onSuccess: (dynamic json) {
          service = LoginService.fromJson(json);
          FlutterStars.SpUtil.putString(
              Constant.accessToken, service.model.accessToken);
          end(msg: '登录成功');
          NavigatorUtils.push(context, UserRouter.userPage);
        });
  }
}
