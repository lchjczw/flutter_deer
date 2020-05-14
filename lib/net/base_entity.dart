import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/net/error_handle.dart';

class BaseEntity<T> {
  int code;
  String message;
  T data;
  List<T> listData = [];

  bool isList;
  bool isData;
  bool isError;

  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    //    错误
    if (json[Constant.error] != null) {
      code = json[Constant.error][Constant.code] ?? ExceptionHandle.not_found;
      message = json[Constant.message] ?? '请求失败';
      isError = true;
      return;
    }

    //    处理list
    if (json[Constant.list] != null) {
      code = ExceptionHandle.success;
      message = '请求成功';
      (json[Constant.list] as List).forEach((item) {
        listData.add(item as T);
      });
      isList = true;
      return;
    }

    data = json as T;
    isData = true;
  }
}
