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
    params,
    onSuccess,
    onError,
  }) {
    model?.query(params: params, onSuccess: onSuccess, onError: onError);
  }

  get({
    id,
    onSuccess,
    onError,
  }) {
    model?.get(id: id, onSuccess: onSuccess, onError: onError);
  }

  post({
    params,
    onSuccess,
    onError,
  }) {
    model?.post(params: params, onSuccess: onSuccess, onError: onError);
  }

  update({
    id,
    params,
    onSuccess,
    onError,
  }) {
    model?.update(
        id: id, params: params, onSuccess: onSuccess, onError: onError);
  }

  delete({
    id,
    onSuccess,
    onError,
  }) {
    model?.delete(id: id, onSuccess: onSuccess, onError: onError);
  }

  enable({
    id,
    onSuccess,
    onError,
  }) {
    model?.enable(id: id, onSuccess: onSuccess, onError: onError);
  }

  disable({
    String id,
    onSuccess,
    onError,
  }) {
    model?.disable(id: id, onSuccess: onSuccess, onError: onError);
  }
}
