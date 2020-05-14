import 'package:flutter_deer/net/dio_utils.dart';

class DemoModel {
  String id;
  String code;
  String name;
  String memo;
  int status;
  String creator;
  String createdAt;
  String updatedAt;

  DemoModel(
      {this.id,
      this.code,
      this.name,
      this.memo,
      this.status,
      this.creator,
      this.createdAt,
      this.updatedAt});

  DemoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    memo = json['memo'];
    status = json['status'];
    creator = json['creator'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['memo'] = this.memo;
    data['status'] = this.status;
    data['creator'] = this.creator;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  //  todo 其他基础业务逻辑 代码生成器生成 会被覆盖
//  ?current=1&pageSize=10&queryValue=%E6%B5%8B%E8%AF%95
  query({
    dynamic params,
    Function(List<dynamic> data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    DioUtils.instance.asyncRequestNetwork(Method.get, '/api/v1/demos',
        queryParameters: params, onSuccessList: onSuccess, onError: onError);
  }

  //  /api/v1/demos/48186073590796288
  get({
    String id,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    DioUtils.instance.asyncRequestNetwork(Method.get, '/api/v1/demos/' + id,
        onSuccess: onSuccess, onError: onError);
  }

  post({
    dynamic params,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    DioUtils.instance.asyncRequestNetwork(Method.post, '/api/v1/demos',
        params: params, onSuccess: onSuccess, onError: onError);
  }
}
