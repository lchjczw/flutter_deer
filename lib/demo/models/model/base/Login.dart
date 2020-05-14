import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
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

  // md5 加密
  static String Md5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  //  todo 其他基础业务逻辑 代码生成器生成
  post({
    dynamic params,
    Function(dynamic base) onSuccess,
    Function(List list) onSuccessList,
    Function(int code, String msg) onError,
  }) async {
    //    await DioUtils.instance.requestNetwork<LoginInfoBase>(
    //        Method.post, '/api/v1/pub/login',
    //        params: params, onSuccess: onSuccess, onError: onError);

    DioUtils.instance.asyncRequestNetwork(Method.post, '/api/v1/pub/login',
        params: params, onSuccess: onSuccess, onError: onError);
  }

  StreamPost(dynamic params) {
    return DioUtils.instance
        .asyncRequestNetwork(Method.post, '/api/v1/pub/login', params: params);
  }

  login({
    dynamic params,
    Function(dynamic base) onSuccess,
    Function(int code, String msg) onError,
  }) {
    post(params: params, onSuccess: onSuccess, onError: onError);
  }
}
