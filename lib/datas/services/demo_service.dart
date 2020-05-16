import '../models/demo_model.dart';

class DemoService {
  DemoModel model;

  DemoService() {
    this.model = DemoModel();
  }

  DemoService.fromJson(Map<String, dynamic> json) {
    model = DemoModel.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = model?.toJson();
    return data;
  }

  query({
    dynamic params,
    Function(List<dynamic> data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    model?.query(params: params, onSuccess: onSuccess, onError: onError);
  }

  get({
    dynamic id,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    model?.get(id: id, onSuccess: onSuccess, onError: onError);
  }

  post({
    dynamic params,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    model?.post(params: params, onSuccess: onSuccess, onError: onError);
  }

  update({
    String id,
    dynamic params,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    model?.update(
        id: id, params: params, onSuccess: onSuccess, onError: onError);
  }

  delete({
    String id,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    model?.delete(id: id, onSuccess: onSuccess, onError: onError);
  }
  enable({
    String id,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    model?.enable(id: id, onSuccess: onSuccess, onError: onError);
  }

  disable({
    String id,
    Function(dynamic data) onSuccess,
    Function(int code, String msg) onError,
  }) {
    model?.disable(id: id, onSuccess: onSuccess, onError: onError);
  }
}

