import 'package:flutter_deer/common/common.dart';
import 'package:flutter_deer/net/error_handle.dart';

class BaseEntity {
  int code;
  String message;
  dynamic data;
  List<dynamic> listData = [];

  bool isList;
  bool isData;
  bool isError;

  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<dynamic, dynamic> json) {
    //    错误
    if (json[Constant.error] != null) {
      json = json[Constant.error];
      code = json[Constant.code] ?? ExceptionHandle.not_found;
      message = json[Constant.message] ?? '请求失败';
      isError = true;
      return;
    }

    //    处理list
    if (json[Constant.list] != null) {
      listData = json[Constant.list];
      code = ExceptionHandle.success;
      message = '请求成功';
//      (json as List).forEach((item) {
//        listData.add(item);
//      });
      isList = true;
      return;
    }

    data = json;
    isData = true;
  }
}
