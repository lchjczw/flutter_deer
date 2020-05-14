import 'package:flutter_deer/bash/base.dart';

import 'file:///F:/project/kcptun/flutter_deer/lib/demo/models/home_repository.dart';

class HomeProvide extends BaseProvide {
  // 页数

  String _data = '点击';

  set data(String t) {
    _data = t;
    notify();
  }

  get data => _data;

  homeInfo(var params) {
    start();

    _repo.info(params, HomeService(),
        onError: (int code, String message) => data = '$code,$message',
        onSeccess: (HomeService d) {
          data = d.toJson().toString();
        });
  }

  final HomeRepo _repo = HomeRepo();
}
