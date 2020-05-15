import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_deer/base/base.dart';
import 'package:flutter_deer/datas/services/demo_service.dart';

class DemoProvide extends BaseProvide {
  // 页数
  DemoService service;
  List<DemoService> list = [];
  String _msg;

  set msg(String s) {
    _msg = s;
    notify();
  }

  String get msg => _msg;

  DemoProvide(BuildContext c) {
    service = DemoService();
    ctx = c;
  }

  query() {
    start(msg: '开始查询');
    var params = {
      "current": 1,
      "pageSize": 10,
      //      "queryValue": "测试",
    };

    service?.query(
        params: params, onError: errDemo, onSuccess: successDemoList);
  }

  get() {
    service?.get(
        id: list[0]?.model?.id ?? '48186073590796288',
        onError: errDemo,
        onSuccess: successDemo);
  }

  String randString({int strlenght = 12}) {
    String alphabet = 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';

    /// 生成的字符串固定长度
    String left = '';
    for (var i = 0; i < strlenght; i++) {
      // right = right + (min + (Random().nextInt(max - min))).toString();
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    return left;
  }

  post() {
    service?.post(params: {
      "code": randString(),
      "memo": randString(),
      "name": randString(),
      "status": 1
    }, onError: errDemo, onSuccess: successOther);
  }

  update() {
    service?.update(
        id: list[0]?.model?.id ?? '48186073590796288',
        params: {
          "code": randString(),
          "memo": randString(),
          "name": randString(),
          "status": 1
        },
        onError: errDemo,
        onSuccess: successOther);
  }

  delete() {
    service?.delete(
        id: list[0]?.model?.id ?? '48186073590796288',
        onError: errDemo,
        onSuccess: successOther);
  }

  enable() {
    service?.enable(
        id: list[0]?.model?.id ?? '48186073590796288',
        onError: errDemo,
        onSuccess: successOther);
  }

  disable() {
    service?.disable(
        id: list[0]?.model?.id ?? '48186073590796288',
        onError: errDemo,
        onSuccess: successOther);
  }

  errDemo(int code, String message) {
    end(msg: message ?? '发生错误');
    msg = message;
  }

  successDemo(dynamic json) {
    print(json);
    service = DemoService.fromJson(json);
    msg = json.toString();
    end(msg: '请求成功');
  }

  successDemoList(List<dynamic> l) {
    end(msg: '请求成功');
    msg = '';
    list = [];
    l.forEach((json) {
      DemoService tmp = DemoService.fromJson(json);
      print(tmp);
      msg += tmp.toJson().toString();
      list.add(tmp);
    });
  }

  successOther(dynamic json) {
    print(json);
    msg = json.toString();
    end(msg: '请求成功');
  }
}
