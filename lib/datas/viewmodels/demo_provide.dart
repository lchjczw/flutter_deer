import 'package:flutter/material.dart';
import 'package:flutter_deer/base/base.dart';
import 'package:flutter_deer/datas/services/demo_service.dart';

class DemoProvide extends BaseProvide {
  // 页数
  DemoService service;

  DemoProvide(BuildContext c) {
    service = DemoService();
    ctx = c;
  }

  query() {
    start(msg: '开始查询');
    var params = {
      "current": 1,
      "pageSize": 10,
      "queryValue": "测试",
    };

    service?.query(
        params: params,
        onError: (code, message) {
          end(msg: message);
        },
        onSuccess: (List<dynamic> list) {
          list.forEach((json) {
            service = DemoService.fromJson(json);
            print(service);
          });
          end(msg: '请求成功');
        });
  }

  get() {
    service?.get(
        id: '48186073590796288',
        onError: (code, message) {
          end(msg: message);
        },
        onSuccess: (dynamic json) {
          service = DemoService.fromJson(json);
          print(service);

          end(msg: '请求成功');
        });
  }

  post() {
    service?.post(
        params: {"code": "123", "memo": "123", "name": "123", "status": 1},
        onError: (code, message) {
          end(msg: message);
        },
        onSuccess: (dynamic json) {
          print(json);
          end(msg: '请求成功');
        });
  }
}
