import 'package:fluro/fluro.dart';
import 'package:flutter_deer/routers/router_init.dart';

import 'demo_page.dart';
import 'index_page.dart';

class TestRouter implements IRouterProvider {
  static String indexPage = '/test/index';
  static String demoPage = '/test/demo';

  @override
  void initRouter(Router router) {
    router.define(indexPage,
        handler: Handler(handlerFunc: (_, params) => IndexPage()));
    router.define(demoPage,
        handler: Handler(handlerFunc: (_, params) => DemoPage()));
  }
}
