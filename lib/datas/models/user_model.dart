import 'package:flustars/flustars.dart' as FlutterStars;
import 'package:flutter_deer/common/common.dart';

class UserModel {
  String avatarUrl;
  String name;
  int id;

  UserModel({this.avatarUrl, this.name, this.id});

  UserModel.fromLocal({this.avatarUrl, this.name, this.id}) {
    if (name == null) {
      name = FlutterStars.SpUtil.getString(Constant.phone);
    }
  }

  fromLocal() {
    String n = FlutterStars.SpUtil.getString(Constant.phone);
    if (n == null) {
      return;
    }
    name = n;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar_url'] = this.avatarUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
