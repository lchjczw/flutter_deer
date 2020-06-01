import 'package:flutter/cupertino.dart';
import 'package:flutter_deer/datas/base/base.dart';

class FingerprintProvider extends BaseProvide {
  List<int> _list;

  FingerprintProvider(BuildContext c) {
    context = c;
  }

  List<int> get list => _list;

  set list(List<int> list) {
    _list = list;
    notifyListeners();
  }
}
