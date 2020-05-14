import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/net/error_handle.dart';

class BaseEntity<T> {
  int code;
  String message;
  T data;
  List<T> listData = [];

  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    //    错误
    if (json[Constant.error] != null) {
      code = json[Constant.error][Constant.code] ?? ExceptionHandle.not_found;
      message = json[Constant.message] ?? '请求失败';
      return;
    }

    //    处理list
    if (json[Constant.list] != null) {
      code = ExceptionHandle.success;
      message = '请求成功';
      (json[Constant.list] as List).forEach((item) {
        listData.add(item as T);
      });
      return;
    }

    data = json as T;
  }

  bool get isData => data == null;

  bool get isList => listData.length != 0;

  bool get isError => code == 200;
}
