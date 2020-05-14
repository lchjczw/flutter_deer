import 'package:flutter_deer/login/model/base/Login.dart';

class LoginInfo extends LoginInfoBase {
//  LoginInfoBase model;

  LoginInfo.fromJson(Map<String, dynamic> json) {
//    model = LoginInfoBase.fromJson(json);
    super.New(json);
  }

  Map<String, dynamic> toJson() {
//    return model.toJson();
    return super.toJson();
  }

  login({
    dynamic params,
    Function(LoginInfo t) onSuccess,
    Function(int code, String msg) onError,
  }) {
    post(params: params, onSuccess: onSuccess, onError: onError);
  }
}
