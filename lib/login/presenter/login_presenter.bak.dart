import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:flutter_deer/bash/base.dart';
import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/login/models/login_entity.dart';
import 'package:flutter_deer/login/page/login_page.dart';
import 'package:flutter_deer/mvp/base_page_presenter.dart';
import 'package:flutter_deer/net/net.dart';
import 'package:flutter_deer/util/toast.dart';
import 'package:rxdart/rxdart.dart';

class LoginPresenter extends BasePagePresenter<LoginPageState>
    with BasePresenter {
  login(Map<String, dynamic> params, success(LoginEntity data),
      {error(int code, String msg)}) {
    asyncRequestNetwork<LoginEntity>(
      Method.post,
      url: LoginApi.login,
      params: params,
      onError: error,
      onSuccess: success,
    );
  }

  login1(call(bool ok)) {
    var name = view.nameController.text;
    var password = view.passwordController.text;
    FlutterStars.SpUtil.putString(Constant.phone, name);

    LoginEntity model = LoginEntity();

    final s = model.login<LoginEntity>({
      "password": model.Md5(password),
      "user_name": name,
      "captcha_code": "string",
      "captcha_id": "string",
    }, LoginEntity()).doOnListen(() {
      Toast.show('登录中');
    }).doOnDone(() {
      Toast.cancelToast();
    }).listen((r) {
      print('============');
      print(r.data);
      if (r.code == 0) {
        call(true);
      } else {
        call(false);
      }
    }, onError: (e, stackTrace) {
      print(e);
    });

    addSubscription(s);
  }

  Login(call(bool ok)) {
    var name = view.nameController.text;
    var password = view.passwordController.text;
    FlutterStars.SpUtil.putString(Constant.phone, name);

    login({
      "password": LoginEntity().Md5(password),
      "user_name": name,
      "captcha_code": "string",
      "captcha_id": "string",
    }, (LoginEntity data) {
      FlutterStars.SpUtil.putString(Constant.accessToken, data.accessToken);
      //  todo
      call(true);
    }, error: (int code, String msg) {
      call(false);
    });
  }
}
