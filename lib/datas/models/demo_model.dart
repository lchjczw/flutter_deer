import 'package:flutter_deer/net/dio_utils.dart';

class DemoModel {
String id;
String name;
String nameId;
String code;
String memo;
String status;
String creator;

  String createdAt;
  String updatedAt;

  DemoModel(
      {
	  this.id,
this.name,
this.nameId,
this.code,
this.memo,
this.status,
this.creator,

  	  });

  DemoModel.fromJson(Map<String, dynamic> json) {
	id = json['id'];
name = json['name'];
nameId = json['name_id'];
code = json['code'];
memo = json['memo'];
status = json['status'];
creator = json['creator'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = this.id;
data['name'] = this.name;
data['name_id'] = this.nameId;
data['code'] = this.code;
data['memo'] = this.memo;
data['status'] = this.status;
data['creator'] = this.creator;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

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

  update({
    String id,
    dynamic params,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    DioUtils.instance.asyncRequestNetwork(Method.put, '/api/v1/demos/' + id,
        params: params, onSuccess: onSuccess, onError: onError);
  }

  delete({
    String id,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    DioUtils.instance.asyncRequestNetwork(Method.delete, '/api/v1/demos/' + id,
        onSuccess: onSuccess, onError: onError);
  }
  enable({
    String id,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    DioUtils.instance.asyncRequestNetwork(
        Method.patch, '/api/v1/demos/' + id + '/enable',
        onSuccess: onSuccess, onError: onError);
  }

  disable({
    String id,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    DioUtils.instance.asyncRequestNetwork(
        Method.patch, '/api/v1/demos/' + id + '/disable',
        onSuccess: onSuccess, onError: onError);
  }
}
