import 'package:fluro/fluro.dart';
import 'package:flutter_deer/routers/router_init.dart';
import 'package:flutter_deer/user/page/ad_toast_page.dart';
import 'package:flutter_deer/user/page/fingerprint_page.dart';

import 'page/message_page.dart';
import 'page/select_address_page.dart';
import 'page/user_page.dart';
import 'page/user_setting_page.dart';

class UserRouter implements IRouterProvider {
  static String userPage = '/user';
  static String userSettingPage = '/user/userSetting';
  static String messagePage = '/user/message';
  static String freightConfigPage = '/user/freightConfig';
  static String addressSelectPage = '/user/addressSelect';
  static String fingerprint = '/user/fingerprint';
  static String adToastPage = '/user/adToast';

  @override
  void initRouter(Router router) {
    router.define(userPage,
        handler: Handler(handlerFunc: (_, params) => UserPage()));
    router.define(userSettingPage,
        handler: Handler(handlerFunc: (_, params) => UserSettingPage()));
    router.define(messagePage,
        handler: Handler(handlerFunc: (_, params) => MessagePage()));
    router.define(addressSelectPage,
        handler: Handler(handlerFunc: (_, params) => AddressSelectPage()));
    router.define(fingerprint,
        handler: Handler(handlerFunc: (_, params) => FingerprintPage()));
    router.define(adToastPage,
        handler: Handler(handlerFunc: (_, params) => AdToastPage()));
  }
}
