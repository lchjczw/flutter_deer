import 'package:flutter_deer/net/dio_utils.dart';

class LoginModel {
  String accessToken;
  int expiresAt;
  String tokenType;

  LoginModel({this.accessToken, this.expiresAt, this.tokenType});

  LoginModel.fromJson(Map<String, dynamic> json) {
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

  //  todo 其他基础业务逻辑 代码生成器生成 会被覆盖
  post({
    dynamic params,
    Function(dynamic base) onSuccess,
    Function(List list) onSuccessList,
    Function(int code, String msg) onError,
  }) {
    DioUtils.instance.asyncRequestNetwork(Method.post, '/api/v1/pub/login',
        params: params, onSuccess: onSuccess, onError: onError);
  }

  StreamPost(dynamic params) {
    return DioUtils.instance
        .asyncRequestNetwork(Method.post, '/api/v1/pub/login', params: params);
  }
}
