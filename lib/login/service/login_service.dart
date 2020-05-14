import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_deer/models/login_model.dart';

class LoginService {
  LoginModel model;

  LoginService({this.model});

  LoginService.fromJson(Map<String, dynamic> json) {
    model = LoginModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = model.toJson();
    return data;
  }

  // md5 加密
  static String Md5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  login({
    dynamic params,
    Function(dynamic base) onSuccess,
    Function(int code, String msg) onError,
  }) {
    model.post(params: params, onSuccess: onSuccess, onError: onError);
  }
}
