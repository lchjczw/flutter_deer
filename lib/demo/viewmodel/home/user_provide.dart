import 'package:flutter_deer/bash/base.dart';

import 'file:///F:/project/kcptun/flutter_deer/lib/demo/models/home_repository.dart';

class UserProvide extends BaseProvide {
  // 页数

  String _data = '不一样的点击';

  set info(String t) {
    _data = t;
    notify();
  }

  get info => _data;

  userUnfo(var params) {
    _repo.info(params, HomeService(),
        onError: (int code, String message) => info = '$code,$message',
        onSeccess: (HomeService d) {
          info = d.toJson().toString();
        });
  }

  final HomeRepo _repo = HomeRepo();
}
