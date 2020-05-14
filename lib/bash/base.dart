import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_deer/net/base_entity.dart';
import 'package:flutter_deer/util/toast.dart';
import 'package:rxdart/rxdart.dart';

/// normal click event
abstract class Presenter {
  /// 处理点击事件
  ///
  /// 可根据 [action] 进行区分 ,[action] 应是不可变的量
  void onClick(String action);
}

/// ListView Item Click
abstract class ItemPresenter<T> {
  /// 处理列表点击事件
  ///
  /// 可根据 [action] 进行区分 ,[action] 应是不可变的量
  void onItemClick(String action, T item);
}

/// BaseProvide
class BaseProvide with ChangeNotifier {
  CompositeSubscription compositeSubscription = CompositeSubscription();

  /// add [StreamSubscription] to [compositeSubscription]
  ///
  /// 在 [dispose]的时候能进行取消
  addSubscription<T>(
      Stream<BaseEntity> stream, StreamSubscription subscription) {
    start();
    stream.doOnDone(() {
      end();
    });
    compositeSubscription.add(subscription);
  }

  @override
  void dispose() {
    if (!compositeSubscription.isDisposed) {
      compositeSubscription.dispose();
    }
    super.dispose();
  }

  var _notify;

  dynamic get notify {
    if (_notify == null) {
      return notifyListeners;
    }
    return _notify;
  }

  set notify(v) {
    _notify = v;
  }

  show(String message) {
    if (message == null || message.isEmpty) {
      return;
    }
    Toast.show(message);
  }

  start({msg: '加载中'}) {
    show(msg);
  }

  end({msg: '加载完成'}) {
    show(msg);
  }
}

/// BaseProvide
mixin BasePresenter {
  CompositeSubscription compositeSubscription = CompositeSubscription();

  /// add [StreamSubscription] to [compositeSubscription]
  ///
  /// 在 [dispose]的时候能进行取消
  addSubscription(StreamSubscription subscription) {
    compositeSubscription.add(subscription);
  }

  void dispose() {
    if (!compositeSubscription.isDisposed) {
      compositeSubscription.dispose();
    }
  }
}

// ignore: camel_case_types
abstract class Init {
  void init();
}
