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
}
