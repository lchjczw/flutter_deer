import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_deer/net/base_entity.dart';
import 'package:flutter_deer/routers/fluro_navigator.dart';
import 'package:flutter_deer/util/utils.dart';
import 'package:flutter_deer/widgets/progress_dialog.dart';
import 'package:rxdart/rxdart.dart';

/// BaseProvide
class BaseProvide with ChangeNotifier {
  BuildContext ctx;

  BuildContext get context => isActive ? ctx : null;

  set context(BuildContext c) {
    context = c;
  }

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
    showProgress(message: message);
  }

  bool _isShowDialog = false;

  bool get isActive {
    try {
      if (ctx?.widget == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  void closeProgress() {
    if (isActive && _isShowDialog) {
      _isShowDialog = false;
      NavigatorUtils.goBack(context);
    }
  }

  void showProgress({String message}) {
    if (message == null || message.isEmpty) {
      message = '正在加载...';
    }

    /// 避免重复弹出
    if (isActive && !_isShowDialog) {
      _isShowDialog = true;
      try {
        showTransparentDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return WillPopScope(
                onWillPop: () async {
                  // 拦截到返回键，证明dialog被手动关闭
                  _isShowDialog = false;
                  return Future.value(true);
                },
                child: ProgressDialog(hintText: message),
              );
            });
      } catch (e) {
        /// 异常原因主要是页面没有build完成就调用Progress。
        print(e);
      }
    }
  }

  start({msg: '正在加载...'}) {
    showProgress(message: msg);
  }

  end({msg: '加载完成'}) {
    closeProgress();
  }
}

abstract class BasePage {
  initProvide();
}
