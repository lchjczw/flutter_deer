import 'package:flutter_deer/net/dio_utils.dart';

class LoginInfoBase {
  String accessToken;
  int expiresAt;
  String tokenType;

  LoginInfoBase({this.accessToken, this.expiresAt, this.tokenType});

  LoginInfoBase.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresAt = json['expires_at'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_at'] = this.expiresAt;
    data['token_type'] = this.tokenType;
    return data;
  }

  New(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresAt = json['expires_at'];
    tokenType = json['token_type'];
  }

  //  todo 其他基础业务逻辑 代码生成器生成

  post({
    dynamic params,
    Function(LoginInfoBase t) onSuccess,
    Function(List<LoginInfoBase> list) onSuccessList,
    Function(int code, String msg) onError,
  }) async {
//    await DioUtils.instance.requestNetwork<LoginInfoBase>(
//        Method.post, '/api/v1/pub/login',
//        params: params, onSuccess: onSuccess, onError: onError);

    DioUtils.instance.asyncRequestNetwork<LoginInfoBase>(
        Method.post, '/api/v1/pub/login',
        params: params, onSuccess: onSuccess, onError: onError);
  }
}
