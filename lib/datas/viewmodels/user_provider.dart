import 'package:flutter_deer/datas/base/base.dart';
import 'package:flutter_deer/datas/models/user_model.dart';

class UserProvider extends BaseProvide {
  UserModel _user;

  UserProvider() {
    _user = UserModel(name: '大地的爱', id: 1);
  }

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notify();
  }

  fromLocal() {
    _user.fromLocal();
    notify();
  }
}
